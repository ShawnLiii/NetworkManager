//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/20/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class NetworkManager
{
    var flag = false
    
    static var `shared` = NetworkManager()
    
    private init(){}
    
    /*private*/ func createDataTask (requestUrl: URL, handler: @escaping (Data) -> ())
    {
        let task = URLSession.shared.dataTask(with: requestUrl)
        { (data, response, error) in
            if let data = data
            {
//                var count = 0
//
//                for _ in 1...10000
//                {
//                    for _ in 1...10000
//                    {
//                        count += 1
//
//                    }
//                }
//                print(count)
                
                handler(data)
            }
        }
        task.resume()
    }
    
    func dataTaskTest(requestUrl: URL, handler: @escaping (Data?, URLResponse?, Error?) -> ())
    {
        let task = URLSession.shared.dataTask(with: requestUrl)
                { (data, response, error) in
                    handler(data,response,error)
                }
                task.resume()
    }
    
    func loadPhotoData(requestUrl: URL, handler: @escaping ([Photo])->())
    {
        var photos = [Photo]()
        createDataTask(requestUrl: requestUrl)
        { (data) in
            do
            {
                let photoContainer = try JSONDecoder().decode(PhotoData.self, from: data)
                self.flag = true
                photos = photoContainer.items
                handler(photos)
            }
            catch
            {
                print(error)
            }
        }
    }
    
    func loadProfileData(requestUrl: URL, handler: @escaping ([Profile])->())
    {
        var profiles = [Profile]()
        createDataTask(requestUrl: requestUrl)
        { (data) in
            do
            {
                let profileContainer = try JSONDecoder().decode(ProfileData.self, from: data)
                profiles = profileContainer.data
                handler(profiles)
            }
            catch
            {
                print(error)
            }
        }
    }
    
    func downloadPhoto(url: URL, handler: @escaping (UIImage?) -> ())
    {
        let task = URLSession.shared.downloadTask(with: url)
        { (downloadedURL, response, error) in
            if let url = downloadedURL
            {
                do
                {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    handler(image)
                }
                catch
                {
                    handler(nil)
                    print(error)
                }
            }
        }
        task.resume()
    }

}


