//
//  ViewController.swift
//  pawnder
//
//  Created by Ninia Sabadze on 04.04.23.
//

import UIKit
import FirebaseAuth
import SwiftUI
import Lottie
class HomeViewController: UIViewController {
    
    var animationView = LottieAnimationView()
    
    private let pawnderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Find A Match...", for: .normal)
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 0.58, green: 0.74, blue: 0.58, alpha: 1.00)
        button.layer.cornerRadius = 8.0
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private func configureAnimation(){
        animationView = .init(name: "homepage_animation")
        //animationView.backgroundColor = .red
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        animationView.play()
        view.addSubview(animationView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pawnderButton)
        pawnderButton.addTarget(self,
                              action: #selector(didTapPawnderButton),
                              for: .touchUpInside)
        configureAnimation()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    
    }

    @objc private func didTapPawnderButton(){
        let vc = UIHostingController(rootView: ContentView())
        present(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animationView.frame = CGRect(
            x: 50,
            y: view.height-653,
            width: view.width-100,
            height: 200
        )
        print(view.height)
        
        pawnderButton.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width-100,
            height: 50
        )
        pawnderButton.center = view.center
    }
    private func handleNotAuthenticated(){
        //Check auth status
        if Auth.auth().currentUser == nil {
            //Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }
}

