//
//  ViewController.swift
//  helpingHandV2
//
//  Created by Hamza Lakhani on 2017-10-05.
//  Copyright © 2017 Hamza Lakhani. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn
class MainScreen: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

   setupFacebookButton()
   setupGoogleButton()
    
        
    }
    
    //Function for adding google sign in button
    fileprivate func setupGoogleButton(){
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    //function for adding Facebook login button
    fileprivate func setupFacebookButton(){
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
    }
    
//Fbsdk Delgeate methods
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did Log out of Facebook")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print("error")
            return
        }
        showEmailAddress()
    }
        
        func showEmailAddress(){
            let accessToken = FBSDKAccessToken.current()
            guard let accessTokenString = accessToken?.tokenString else
            {return}
            
            let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            Auth.auth().signIn(with: credentials) { (user, error) in
                if error != nil {
                    print("Something went wrong with FB user: ",error ?? "")
                    return
                }
                print("Successfully logged in with our user: ",user ?? "")
            }
            
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email" ]).start { (connection, result, err) in
                if err != nil {
                    print("Failed to start graph resquest:", err ?? "")
                    return
                }
                print(result ??  "")
            }
        }
        }



