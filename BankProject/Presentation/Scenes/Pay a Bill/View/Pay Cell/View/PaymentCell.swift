//
//  PaymentCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

class PaymentCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
   
    // MARK: - Private Properties
    
    private var datasource: PaymentListDataSource!
    private var viewModel: PaymentListViewModelProtocol!
    private var paymentManager: PaymentManagerProtocol!
    private var networkManager: NetworkManagerProtocol!
    private var coordinator: CoordinatorProtocol?
    
    // MARK: - Life Cyrcle

    override func awakeFromNib() {
        super.awakeFromNib()

        registerCell()
    }
    
    private func registerCell() {
        collectionView.registerNib(class: PaymentItemCell.self)
    }
    
    func configure(coordinator: CoordinatorProtocol) {
        
        self.coordinator = coordinator
        setupViewModel()
    }
    
    private func setupViewModel() {
        networkManager = NetworkManager()
        paymentManager = PaymentManager(with: networkManager)
        viewModel = PaymentListViewModel(with: paymentManager, coordinator: coordinator!)
        datasource = PaymentListDataSource(collectionView: collectionView, viewModel: viewModel)
        
        datasource.refresh()
    }
}
