//
//  UIViewController+Extension.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import UIKit

extension UIViewController {
    func closeKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
    }
}
