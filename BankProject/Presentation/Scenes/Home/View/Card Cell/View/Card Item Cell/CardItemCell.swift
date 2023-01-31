//
//  CardItemCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 18.01.23.
//

import UIKit

class CardItemCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var cardImageView: UIImageView!
    @IBOutlet private weak var myCardLabel: UILabel!
    @IBOutlet private weak var standardLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayut()
    }
    
    private func setupLayut() {
        cardImageView.layer.cornerRadius = 3
    }
    
    func configure(with item: Card) {
        cardImageView.image = item.image
        myCardLabel.text = item.title
        standardLabel.text = item.content
        amountLabel.text = item.amount
    }
}
