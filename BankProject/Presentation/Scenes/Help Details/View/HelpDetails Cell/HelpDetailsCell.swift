//
//  HelpDetailsCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 26.01.23.
//

import UIKit
import Kingfisher

class HelpDetailsCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var lineView: UIView!
    @IBOutlet private weak var backgoundView: UIView!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    func setupLayout() {
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
        backgoundView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.navyBlue)
    }
    
    func configure(with item: HelpDetailViewModel) {
        titleLabel.text = item.title
        picture.kf.setImage(with: URL(string: item.imageUrl))
    }
}
