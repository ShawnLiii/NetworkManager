//
//  AlertManagement.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/22/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class AlertManager
{
    
    enum AlertType: String
    {
        case urlInvalid = "URL is invalid"
        case userAuthenticateFailed = "User Authentication is incorrect! \n\nPlease Follow the Placeholder"
    }
    
    static func alert(forWhichPage viewController: UIViewController, alertType: AlertType)
    {
        var message = String()

        switch alertType
        {
        case .urlInvalid:
            message = AlertType.urlInvalid.rawValue
        case .userAuthenticateFailed:
            message = AlertType.userAuthenticateFailed.rawValue
        }
        
        let alterController = UIAlertController(title: "Warning!", message: message, preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alterController.addAction(alertAction)
        viewController.present(alterController, animated: true, completion: nil)
    }
}
