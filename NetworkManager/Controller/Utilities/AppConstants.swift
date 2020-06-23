//
//  AppConstants.swift
//  LoginChecking
//
//  Created by Shawn Li on 5/22/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

struct AppConstants
{
    struct UserInfo
    {
        static let account = "lightowlgg"
        static let password = "topikachu"
        static let keyOfStatus = "statusOfLogin"
    }

    struct Network
    {
        static let urlPath1 = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
        static let urlPath2 = "https://reqres.in/api/users?page=2"
    }
    
    struct Cell
    {
        static let cellOfTV = "photo"
        static let cellOfCV = "profile"
    }
    
    struct Home
    {
        static let homeVC = "home"
    }
}

