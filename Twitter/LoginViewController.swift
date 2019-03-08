//
//  LoginViewController.swift
//  Twitter
//
//  Created by Mikiann Mcintosh on 3/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
   
    //once your page is up you want to check if user defalut is on the specific key
   override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    @IBAction func onTapAction(_ sender: Any) {
        let urlString = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: urlString, success: {
            //hy the user logged in so don't ask to login again
            //That app should look at that log to say that that user already logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        // login in succes you want to present hometableVC
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }, failure: { (Error) in
        // unify user accunt has succeeded
            print("Error has occurred. Unable to log-in")
            let title = "Error"
            let message = "An error has occured. Unable to log-in."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
       
    }
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    
   
    
    

}
