//
//  OfferDetailsController.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import UIKit
import WebKit

class OfferDetailsController: BaseViewController {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var loading: UIActivityIndicatorView!
    
    // MARK: - Private Properties
    
    private var viewModel: OfferDetailsViewModelProtocol!
    
    // MARK: - Internal Properties
    
    var indexPath: Int?
    var offer: OfferViewModel?
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
    }
    
    private func configureViewModel() {
        guard let offer = offer else { return }
        guard let indexPath = indexPath else { return }
        viewModel = OfferDetailsViewModel(with: webView, offer: offer, indexPath: indexPath, loading: loading)
        
        viewModel.loadWebSite()
    }
    
    // MARK: - Private IBActions
    
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
