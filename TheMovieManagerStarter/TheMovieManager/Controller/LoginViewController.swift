//
//  LoginViewController.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginViaWebsiteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = "hiutrun"
        passwordTextField.text = "Hieu123456"
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        TMDBClient.getRequestToken(completion: handleRequestTokenResponse(success:error:))
    }
    
    @IBAction func loginViaWebsiteTapped() {
        performSegue(withIdentifier: "completeLogin", sender: nil)
    }
    
    func handleRequestTokenResponse(success: Bool, error: Error?){
        if success{
            print(TMDBClient.Auth.requestToken)
            DispatchQueue.main.async {
                TMDBClient.login(username: self.emailTextField.text ?? "",
                                 password: self.passwordTextField.text ?? "",
                                 completion: self.handleLoginRequestResponse(success:error:))
            }
        }
    }
    
    func handleLoginRequestResponse(success:Bool, error: Error?){
        if success{
            print(success)
        }else{
            print(error)
        }
//        TMDBClient.createSessionId(completion: handleCreateSessionId(success:error:))
    }
    
    func handleCreateSessionId(success:Bool, error:Error?){
        if success{
            print(TMDBClient.Auth.sessionId)
        }else{
            print(error)
        }
    }
}
