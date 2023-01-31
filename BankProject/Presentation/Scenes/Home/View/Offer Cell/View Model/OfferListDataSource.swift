//
//  OfferDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 17.01.23.
//

import UIKit

class OfferListDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK:  - Private Properties
    
    private var collectionView: UICollectionView!
    private var offers: [OfferViewModel] = []
    private var viewModel: OfferListViewModelProtocol!
    
    init(collectionView: UICollectionView, viewModel: OfferListViewModelProtocol) {
        super.init()
        self.collectionView = collectionView
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func getOffersList() {
        viewModel.fetchOfferList { [weak self] offers in
            DispatchQueue.main.async {
                self?.offers = offers
                self?.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(OfferItemCell.self, for: indexPath)
        cell.configure(with: offers[indexPath.row])
        return cell
    }
}

extension OfferListDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.coordinator.goToOfferDetails(with: indexPath.row, offer: offers[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OfferListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        CGSize(width: collectionView.bounds.width - 25 - 50, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        25
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}
