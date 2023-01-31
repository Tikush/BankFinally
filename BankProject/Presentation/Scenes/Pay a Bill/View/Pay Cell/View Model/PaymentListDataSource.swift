//
//  PayDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit

class PaymentListDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private IBOutlets
    
    private var collectionView: UICollectionView
    private var viewModel: PaymentListViewModelProtocol!
    private var categories: [PaymentViewModel] = []
    
    init(collectionView: UICollectionView, viewModel: PaymentListViewModelProtocol) {
        self.collectionView = collectionView
        
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchCategoriesOfPayment { [weak self] categories in
            DispatchQueue.main.async {
                self?.categories = categories
                self?.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.deque(PaymentItemCell.self, for: indexPath)
        cell.configure(with: categories[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PaymentListDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.coordinator.goToCompanies(with: categories[indexPath.row].name)
        print(#function)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PaymentListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.bounds.width / 2.7, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        25
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}

