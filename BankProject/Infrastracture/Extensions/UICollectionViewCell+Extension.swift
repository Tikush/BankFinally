//
//  UICollectionViewCell+Extension.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
