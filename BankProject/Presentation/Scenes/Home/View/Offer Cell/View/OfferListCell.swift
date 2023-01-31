//
//  OfferCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class OfferListCell: UITableViewCell {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    
    private var datasource: OfferListDataSource!
    private var networkManager: NetworkManagerProtocol!
    private var viewModel: OfferListViewModelProtocol!
    private var offerManager: OfferManagerProtocol!
    private var coordinator: CoordinatorProtocol!
    
    // MARK - Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerCell()
    }
    
    private func registerCell() {
        collectionView.registerNib(class: OfferItemCell.self)
    }
    
    func configure(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        configureViewModel()
    }
    
    private func configureViewModel() {
        networkManager = NetworkManager()
        offerManager = OfferManager(with: networkManager)
        viewModel = OfferListViewModel(with: coordinator, offerManager: offerManager)
        datasource = OfferListDataSource(collectionView: collectionView, viewModel: viewModel)
        
        datasource.getOffersList()
    }
}
