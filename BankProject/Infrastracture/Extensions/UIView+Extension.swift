//
//  UIView+Extension.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 18.01.23.
//

import UIKit

extension UIView {
    
    // MARK: - Round Corners
    
    func customCornerView(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = false
    }
}
