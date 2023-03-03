//
//  CompanyDetailsViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 28.01.23.
//

import UIKit
import Kingfisher

class CompanyDetailsViewController: BaseViewController {
   
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var lineView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var payButton: UIButton!
    
    // MARK: Private Properties
    
    private var viewModel: CompanyDetailsViewModelProtocol!
    
    // MARK: - Internal Properties
    
    var imageUrl: String?
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
        payButton.customCornerButton(cornerRadius: 5, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }
    
    private func setCompanyDetails() {
        nameLabel.text = companyName ?? ""
        let url = URL(string: imageUrl ?? "")
        picture.kf.setImage(with: url)
    }
    
    private func configureViewModel() {
        viewModel = CompanyDetailsViewModel(with: coordinator!)
    }
    
    // MARK:  - Private IBActions
    
    @IBAction func onPay(_ sender: Any) {
        viewModel.coordinator.goToPayDetails(with: nameLabel.text ?? "", image: picture.image ?? UIImage())
    }
    
    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CompanyDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
