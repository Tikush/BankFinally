//
//  InviteTableViewCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 19.01.23.
//

import UIKit

class InviteCell: UITableViewCell {

    // MARK: - Private IBOutlets
    
    @IBOutlet weak var inviteView: UIView!
    @IBOutlet weak var clickButton: UIButton!
    
    // MARK: - Private Properties
    
    private var coordinator: CoordinatorProtocol!
    private var viewModel: InviteViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }

    private func setupLayout() {
        inviteView.customCornerView(cornerRadius: 7, borderWidth: 0.3, borderColor: Constants.Color.navyBlue)
        clickButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }
    
    func configure(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = InviteViewModel(with: coordinator)
    }
    
    // MARK: - Private IBActions
    
    @IBAction private func onClick(_ sender: Any) {
        viewModel.coordinator.goToInviteDetails()
    }
}
