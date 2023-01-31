//
//  OfferDetailsViewModel.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import WebKit

protocol OfferDetailsViewModelProtocol: AnyObject {
    
    init(with webView: WKWebView, offer: OfferViewModel, indexPath: Int, loading: UIActivityIndicatorView)

    func loadWebSite()
}

final class OfferDetailsViewModel: OfferDetailsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private var webView: WKWebView
    private var offer: OfferViewModel
    private var indexPath: Int
    private var loading: UIActivityIndicatorView
    
    var didFinishedLoading: (() -> Void)?
    
    init(with webView: WKWebView, offer: OfferViewModel, indexPath: Int, loading: UIActivityIndicatorView) {
        self.webView = webView
        self.offer = offer
        self.indexPath = indexPath
        self.loading = loading
    }

    func loadWebSite() {
        guard let url = offer.webUrl else {
            return }
        self.loading.stopAnimating()
        self.webView.load(URLRequest(url: url))
    }
}
