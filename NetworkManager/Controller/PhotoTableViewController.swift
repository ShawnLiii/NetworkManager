//
//  PhotoTableViewController.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/20/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController
{
    var photos = [Photo]()
    var flag = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
    }
    
    func setupUI()
    {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = false
        
        if let url = URL(string: AppConstants.Network.urlPath1)
        {
            NetworkManager.shared.loadPhotoData(requestUrl: url)
            { (photosData) in
                
                self.photos = photosData
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
            }
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .urlInvalid)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.Cell.cellOfTV, for: indexPath) as! PhotoTableViewCell
        let photo = photos[indexPath.row]
        
        cell.photoTitleLab.text = photo.title
        
        NetworkManager.shared.downloadPhoto(url: photo.media.m)
        { (image) in
            if let image = image
            {
                DispatchQueue.main.async
                {
                    cell.photoImage.image = image
                }
            }
        }
        
        flag = true
        return cell
        
    }
}
