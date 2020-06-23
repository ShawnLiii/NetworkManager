//
//  UserAuthentication.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/22/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class UserAuthentication
{
    static func logout(forWhichPage viewController: UIViewController)
    {
        UserDefaults.standard.set(false, forKey: AppConstants.UserInfo.keyOfStatus)
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
