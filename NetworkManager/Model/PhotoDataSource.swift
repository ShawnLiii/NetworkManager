//
//  Photo.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/20/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

struct Media: Decodable
{
   let m: URL
}

struct Photo: Decodable
{
   let title: String
   let media: Media
}

struct PhotoData: Decodable
{
    let items: [Photo]
}
