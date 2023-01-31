//
//  WellcomeCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class WellcomeCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func configure(with item: Wellcome) {
        imageView.image = item.image
        titleLabel.text = item.title
    }
}
