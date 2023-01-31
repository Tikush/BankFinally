//
//  UIButtonExtension.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 18.01.23.
//

import UIKit

extension UIButton {
    
    // MARK: - Round Corners
    
    func customCornerButton(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}
