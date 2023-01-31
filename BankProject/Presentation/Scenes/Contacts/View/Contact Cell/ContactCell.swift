//
//  ContactCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 25.01.23.
//

import UIKit

protocol ContactDelegate: AnyObject {
    func sendMessage(with phone: String)
}

class ContactCell: UITableViewCell {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var inviteButton: UIButton!
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var lineView: UIView!
    
    // MARK: - Internal Properties
    
    weak var delegate: ContactDelegate?
    
    // MARK:  - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupLayout()
    }
    
    override func prepareForReuse() {
//        picture.image = nil
    }
    
    private func setupLayout() {
        inviteButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
        picture.customCornerImage(cornerRadius: 5, borderWidth: 0.0, borderColor: Constants.Color.blueDown)
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }

    func configute(with item: ContactViewModel) {
        nameLabel.text = item.fullName
        phoneLabel.text = item.phoneNumbers
        if picture.image != nil {
            symbolLabel.isHidden = true
            picture.isHidden = false
            picture.image = item.image
        } else {
            symbolLabel.isHidden = false
            picture.isHidden = true
            symbolLabel.text = item.firstSymbol
        }
    }
    
    // MARK:  - Private IBActions
    
    @IBAction private func onInvite(_ sender: UIButton) {
        delegate?.sendMessage(with: phoneLabel.text ?? "")
    }
}
