//
//  WelcomeViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 16.01.23.
//

import UIKit

class WellcomeViewController: BaseViewController {

    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    // MARK: - Private Properties
    
    private var datasource: WellcomeDataSource!
    private var wellcomeData: WellcomeData!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureDataSource()
        setupLayout()
    }
    
    private func setupLayout() {
        loginButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        registerButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    func registerCell() {
        collectionView.registerNib(class: WellcomeCell.self)
    }
    
    func configureDataSource() {
        wellcomeData = WellcomeData()
        datasource = WellcomeDataSource(collectionView: collectionView, pageControl: pageControl, wellcomeData: wellcomeData.data)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        coordinator?.logIn(with: self)
    }
    
    @IBAction func onRegister(_ sender: Any) {
        coordinator?.register(with: self)
    }
    
}
