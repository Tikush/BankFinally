//
//  InviteDetailsViewController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 24.01.23.
//

import UIKit

class InviteDetailsViewController: BaseViewController {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var sendButton: UIButton!
    @IBOutlet private weak var pictureView: UIView!
    @IBOutlet private weak var pasteboardButton: UIButton!
    
    // MARK: - Private Properties
    
    private var viewModel: InviteDetailsViewModelProtocol!
    
    // MARK:  - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupViewModel()
    }
    
    private func setupLayout() {
        shareButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        sendButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        pictureView.customCornerView(cornerRadius: 7, borderWidth: 0.5, borderColor: Constants.Color.brandBlue)
        pasteboardButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    private func setupViewModel() {
        viewModel = InviteDetailsViewModel(controller: self)
    }
    
    // MARK: - Private IBActions
    
    @IBAction private func onShare(_ sender: Any) {
        viewModel.openActivitySheet()
    }
    
    @IBAction private func onSend(_ sender: Any) {
        viewModel.controller.coordinator?.goToContacts()
    }
    
    @IBAction private func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func animateCopyText(_ sender: Any) {
        pasteboardButton.setTitle("Copied", for: .normal)
    }
    
    @IBAction func copyText(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = "Qer2FJD"
    }
}
