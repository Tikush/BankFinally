//
//  LoginViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var mailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        closeKeyboard()
    }
    
    private func setupLayout() {
        loginButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    // MARK: Private IBActions
    
    @IBAction private func onLogin(_ sender: Any) {
        guard let email = mailTextField.text?.isNotEmpty,
              let password = passwordTextField.text?.isNotEmpty else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if error == nil {
                print("Log In")
                self.dismiss(animated: true, completion: nil)
            } else {
            }
        }
        
        Auth.auth().addStateDidChangeListener() { _, user in
            if user != nil {
                self.coordinator?.main()
            }
        }
    }
    
    @IBAction private func onClose(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension String {
    var isNotEmpty: String? {
        if self.isEmpty { return nil }
        return self
    }
}
