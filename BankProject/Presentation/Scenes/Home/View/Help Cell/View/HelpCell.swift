//
//  HelpCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 19.01.23.
//

import UIKit

class HelpCell: UITableViewCell {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var helpButton: UIButton!
    
    // MARK: - Private Properties
    
    private var coordinator: CoordinatorProtocol!
    private var viewModel: HelpViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupLayout()
    }
    
    private func setupLayout() {
        helpButton.customCornerButton(cornerRadius: 7, borderWidth: 0.3, borderColor: Constants.Color.navyBlue)
    }
    
    func configure(with coordinator: CoordinatorProtocol) {
        
        self.coordinator = coordinator
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = HelpViewModel(with: coordinator)
    }
    
    // MARK: - Private IBActions

    @IBAction private func onHelp(_ sender: Any) {
        viewModel.coordinator.goToHelpDetails()
    }
}
