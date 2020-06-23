//
//  PhotoCollectionViewController.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/21/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photo"

class ProfileCollectionViewController: UICollectionViewController
{

    var photos = [Photo]()
    var urlPath = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        fetchDataSource()
    }

    // MARK: - Flow Layout and DataSource Setting
    
    func setupUI()
    {
        let width = (view.frame.size.width - 10) / 2
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width + 80)
        collectionView.collectionViewLayout = layout
    }
    
    func fetchDataSource()
    {
        if let url = URL(string: urlPath)
        {
            NetworkManager.shared.loadPhotoData(requestUrl: url)
            { (photos) in
                DispatchQueue.main.async
                {
                    self.photos = photos
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
    
        // Configure the cell
        cell.titleLabel.text = photos[indexPath.row].title
        NetworkManager.shared.downloadPhoto(url: photos[indexPath.row].media.m)
        { (image) in
            
            DispatchQueue.main.async
            {
                cell.photoImage.image = image
            }
        }
        return cell
    }
}
