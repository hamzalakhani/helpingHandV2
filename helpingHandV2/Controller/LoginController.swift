//
//  LoginController.swift
//  helpingHandV2
//
//  Created by Hamza Lakhani on 2017-10-24.
//  Copyright © 2017 Hamza Lakhani. All rights reserved.
//

import UIKit

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
        return button
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        
        view.addSubview(inputsContainerview)
        view.addSubview(loginRegistorButton)
        
        setupnputContainersView()
        setupLoginRegisterButton()
    }
    

    func setupnputContainersView() {
        //need x, y width and height constraints

        inputsContainerview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        inputsContainerview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //adding Text fields
        inputsContainerview.addSubview(nameTextField)
        //need x, y width and height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerview.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerview.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerview.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerview.heightAnchor, multiplier: 1/3).isActive = true

        
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


