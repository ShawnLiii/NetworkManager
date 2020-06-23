//
//  PhotoCollectionViewController.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/21/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit



class ProfileCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{

    var profiles = [Profile]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        fetchDataSource()
    }

    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
    }
    
    // MARK: - Flow Layout and DataSource Setting
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (view.frame.size.width - 10) / 2
        
        return CGSize(width: width, height: width + 80)
    }
    
    func setupUI()
    {
//        let width = (view.frame.size.width - 10) / 2
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: width, height: width + 80)
//        collectionView.collectionViewLayout = layout
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func fetchDataSource()
    {
        if let url = URL(string: AppConstants.Network.urlPath2)
        {
            NetworkManager.shared.loadProfileData(requestUrl: url)
            { (profiles) in
                self.profiles = profiles
                DispatchQueue.main.async
                {
                    self.collectionView.reloadData()
                }
            }
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .urlInvalid)
        }
    }
    
    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return profiles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.Cell.cellOfCV, for: indexPath) as! ProfileCollectionViewCell
        let profile = profiles[indexPath.row]

        cell.titleLabel.text = profile.first_name + " " + profile.last_name
        
        NetworkManager.shared.downloadPhoto(url: profile.avatar)
        { (image) in
            
            DispatchQueue.main.async
            {
                cell.photoImage.image = image
            }
        }
        return cell
    }
}
