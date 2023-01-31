//
//  UIImage+Extension.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit

extension UIImageView {
    
    // MARK: - Round Corners
    
    func customCornerImage(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}
