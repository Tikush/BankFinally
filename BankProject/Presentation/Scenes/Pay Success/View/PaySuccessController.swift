//
//  PaySuccessController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import UIKit

class PaySuccessController: BaseViewController {

    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var mainButton: UIButton!
    
    // MARK: Private Properties
    
    private var viewModel: PaySuccessViewModelProtocol!
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        mainButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }
    
    private func configureViewModel() {
        viewModel = PaySuccessViewModel(with: coordinator!)
    }
    
    @IBAction func onMain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
