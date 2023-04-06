//
//  LoginViewController.swift
//  pawnder
//
//  Created by Ninia Sabadze on 04.04.23.
//

import UIKit

class LoginViewController: UIViewController {

    private let usernameEmailField : UITextField = {
        return UITextField()
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton : UIButton = {
        return UIButton()
    }()
    
    private let headerView : UIView = {
        return UIView()
    }()
    
    private let termsButton : UIButton = {
        return UIButton()
    }()
    
    private let privacyButton : UIButton = {
        return UIButton()
    }()
    
    private let createAccountButton : UIButton = {
        return UIButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
    }
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(headerView)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
    }
    
    @objc private func didTapLoginButton(){
        
    }
    @objc private func didTapTermButton(){
        
    }
    @objc private func didTapPrivacyButton(){
        
    }
    @objc private func didTapCreateAccountButton(){
        
    }
}
