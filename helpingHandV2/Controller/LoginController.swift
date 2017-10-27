//
//  LoginController.swift
//  helpingHandV2
//
//  Created by Hamza Lakhani on 2017-10-24.
//  Copyright © 2017 Hamza Lakhani. All rights reserved.

import UIKit
import Firebase
import FirebaseDatabase

class LoginController: UIViewController {
    
//Programatically creating the layout
    
    let inputsContainerview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    let loginRegistorButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(displayP3Red: 65/255, green: 105/255, blue: 225/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //programatically added touch up inside on button
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    
    //getting user into databse
    @objc func handleRegister()  {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form not complete")
            return
        }
        //getting user into database
        Auth.auth().createUser(withEmail: email, password: password) { (user: User?, error) in
            if error != nil{
                print(error as Any)
                return
            } 
        }
        
        //successufully authenticated user
        let ref = Database.database().reference(fromURL: "https://helpinghandv2.firebaseio.com/")
        let values = ["name": name, "email": email]
        ref.updateChildValues(values) { (err, ref) in
            
            if err != nil {
                print (err as Any)
                return
            }
            print("Saved user successfully into Firbase database")
        }
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let nameSeparatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    
    let passwordSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cooking")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        view.backgroundColor = UIColor(displayP3Red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        
        view.addSubview(inputsContainerview)
        view.addSubview(loginRegistorButton)
        view.addSubview(profileImageView)
        
        setupnputContainersView()
        setupLoginRegisterButton()
        setupProfileImageView()
    }
    
    func setupProfileImageView(){
        //need x, y width and height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerview.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupnputContainersView() {
        //need x, y width and height constraints

        inputsContainerview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        inputsContainerview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //adding Text fields
        inputsContainerview.addSubview(nameTextField)
        inputsContainerview.addSubview(nameSeparatorView)
        inputsContainerview.addSubview(emailTextField)
        inputsContainerview.addSubview(emailSeparatorView)
        inputsContainerview.addSubview(passwordTextField)
        inputsContainerview.addSubview(passwordSeparatorView)
        
        //NAME
        //need x, y width and height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerview.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerview.heightAnchor, multiplier: 1/3).isActive = true

        //need x, y width and height constraints for fields(name)
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor  ).isActive = true
        
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //EMAIL
        //need x, y width and height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerview.heightAnchor, multiplier: 1/3).isActive = true
        
        //need x, y width and height constraints for fields(name)
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor  ).isActive = true
        
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //PASSWORD
        //need x, y width and height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerview.heightAnchor, multiplier: 1/3).isActive = true
        
        
        
    }
    
    func setupLoginRegisterButton() {
        //need x, y width and height constraints
        
        loginRegistorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegistorButton.topAnchor.constraint(equalTo: inputsContainerview.bottomAnchor, constant: 12).isActive = true
        
        loginRegistorButton.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        loginRegistorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}


