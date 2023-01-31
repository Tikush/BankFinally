//
//  CardCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class CardCell: UITableViewCell {

    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var detailsButton: UIButton!
    
    // MARK: Private Properties
    
    private var datasource: CardDataSource!
    private var cardData: CardData!
    private var coordinator: CoordinatorProtocol!
    private var viewModel: CardsViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureDataSource()
        setupLayout()
    }
    
    func configure(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = CardsViewModel(with: coordinator)
    }
    
    private func configureDataSource() {
        cardData = CardData()
        datasource = CardDataSource(tableView: tableView, cardData: cardData.data)
    }
    
    private func setupLayout() {
        cardView.customCornerView(cornerRadius: 7, borderWidth: 0.3, borderColor: Constants.Color.navyBlue)
        detailsButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }

    @IBAction func onDetails(_ sender: Any) {
//        viewModel.coordinator. //load wibe site
    }
}
