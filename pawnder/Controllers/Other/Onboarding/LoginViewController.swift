//
//  LoginViewController.swift
//  pawnder
//
//  Created by Ninia Sabadze on 04.04.23.
//

import UIKit

class LoginViewController: UIViewController {

    struct Constants{
        static let cornerRadius : CGFloat = 8.0
    }
    
    //unanimous closure
    private let usernameEmailField : UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    //buttons
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Create an Account", for: .normal)
        
        return button
    }()
    
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    
    //header
    private let headerView : UIView = {
        let header = UIView()
        header.layer.masksToBounds = true
        let backgroundView = UIImageView(image: UIImage(named: "top_gradient"))
        header.addSubview(backgroundView)
        return header
    }()
    
    //footer
    private let footerView : UIView = {
        let footer = UIView()
        footer.layer.masksToBounds = true
        let backgroundView = UIImageView(image: UIImage(named: "bottom_gradient"))
        footer.addSubview(backgroundView)
        return footer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        createAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccountButton),
                              for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didTapTermButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        )
        
//        footerView.frame = CGRect(
//            x: 0,
//            y: view.height-view.safeAreaInsets.bottom-50,
//            width: view.width,
//            height: view.height/3.0
//        )
        
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width-50,
            height: 52.0
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width-50,
            height: 52.0
        )
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50
        )
        
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-50,
            width: view.width-20,
            height: 50
        )
        configureHeaderView()
        //configureFooterView()
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else{
            return
        }
        
        guard let backgroundView = headerView.subviews.first else{
            return
        }
        backgroundView.frame = headerView.bounds
        
        //add logo
        let imageView = UIImageView(image: UIImage(named: "PawnderLogo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: headerView.width/4.0,
            y: view.safeAreaInsets.top,
            width: headerView.width/2.0,
            height: headerView.height - view.safeAreaInsets.top
        )
        
    }
    
    private func configureFooterView(){
        guard footerView.subviews.count == 1 else{
            return
        }
        
        guard let backgroundView = footerView.subviews.first else{
            return
        }
        backgroundView.frame = footerView.bounds
        
        //add buttons
        footerView.addSubview(termsButton)
        footerView.addSubview(privacyButton)
        
    }
    
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(headerView)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(footerView)
    }
    
    @objc private func didTapLoginButton(){
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else{
            return
        }
        
        //login functionality
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            //email
            email = usernameEmail
        }else{
            //username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password){success in
            DispatchQueue.main.async{
                if success{
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                }else{
                    //error occured
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in",
                                                  preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert, animated: true)
                }
            }
            
        }
    }
    
    @objc private func didTapTermButton(){
        
    }
    @objc private func didTapPrivacyButton(){
        
    }
    @objc private func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldButton(textField: UITextField) -> Bool{
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLoginButton()
        }
        
        return true
    }
}
