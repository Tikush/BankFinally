//
//  RegisterViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: BaseViewController {
    
    // MARK: - Private IBOutlets

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        closeKeyboard()
    }
    
    private func setupLayout() {
        registerButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    // MARK: - Private IBActions
    
    @IBAction private func onRegister(_ sender: Any) {
        guard let email = emailTextField.text?.isNotEmpty,
            let password = passwordTextField.text?.isNotEmpty,
            let _ = phoneTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if error == nil {
                Auth.auth().signIn(withEmail: email, password: password)
                print("Register")
                self.dismiss(animated: true)
                self.coordinator?.main()
            } else {
            }
        }
    }
    
    @IBAction private func onClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
