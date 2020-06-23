//
//  LoginCheckViewController.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/22/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class LoginCheckViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
//
//    override func viewDidAppear(_ animated: Bool)
//    {
//
//    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton)
    {
        if usernameTF.text == AppConstants.UserInfo.account, passwordTF.text == AppConstants.UserInfo.password
        {
            UserDefaults.standard.set(true, forKey: AppConstants.UserInfo.keyOfStatus)
            navToHome(animate: true)
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .userAuthenticateFailed)
        }
    }
    
    func setupUI()
    {
        usernameTF.delegate = self
        passwordTF.delegate = self
        
        if UserDefaults.standard.bool(forKey:AppConstants.UserInfo.keyOfStatus)
        {
           navToHome(animate: false)
        }
    }
    
    func navToHome(animate: Bool)
    {
        let home = self.storyboard?.instantiateViewController(identifier: AppConstants.Home.homeVC) as! PhotoTableViewController
        self.navigationController?.pushViewController(home, animated: animate)
    }
    
    // MARK: - Text Field Delegate Method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        usernameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }

}
