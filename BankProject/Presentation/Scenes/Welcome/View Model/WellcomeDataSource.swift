//
//  WellcomeDataSource.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit
import Foundation

class WellcomeDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    
    private var collectionView: UICollectionView!
    private var wellcomeData: [Wellcome]
    private var pageControl: UIPageControl!
    private var currentPage = 0
    
    init(collectionView: UICollectionView, pageControl: UIPageControl, wellcomeData: [Wellcome]) {
        
        self.collectionView = collectionView
        self.wellcomeData = wellcomeData
        self.pageControl = pageControl
        self.collectionView.isPagingEnabled = true
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        wellcomeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(WellcomeCell.self, for: indexPath)
        cell.configure(with: wellcomeData[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension WellcomeDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        DispatchQueue.main.async {
            self.pageControl.currentPage = self.currentPage
        }
    }
}

