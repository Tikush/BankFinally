//
//  PayDetailsViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import UIKit

class PayDetailsViewController: BaseViewController {

    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var lineView: UIView!
    
    // MARK: Private Properties
    
    private var viewModel: PayDetailsViewModelProtocol!
    
    // MARK: - Internal Properties
    
    var image: UIImage?
    var companyName: String?
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
        setupLayout()
        configureViewModel()
        setCompanyDetails()
        closeKeyboard()
    }
    
    private func setupLayout() {
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
        cardView.customCornerView(cornerRadius: 7, borderWidth: 0.2, borderColor: Constants.Color.blueDown)
        nextButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }
    
    private func setCompanyDetails() {
        nameLabel.text = companyName ?? ""
        picture.image = image
    }
    
    private func configureViewModel() {
        viewModel = PayDetailsViewModel(with: coordinator!)
    }
    
    // MARK:  - Private IBActions
    
    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onNext(_ sender: Any) {
        viewModel.coordinator.goToPaySuccess()
    }
}

extension PayDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
