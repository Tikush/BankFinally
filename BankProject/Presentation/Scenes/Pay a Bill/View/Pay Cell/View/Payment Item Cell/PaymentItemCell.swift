//
//  PayItemCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 20.01.23.
//

import UIKit
import Kingfisher

class PaymentItemCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var lineView: UIView!
    
    // MARK: - Life Cyrcle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
    
    private func setupLayout() {
        layer.masksToBounds = true
        layer.cornerRadius = 7
        layer.borderWidth = 1
        layer.borderColor = Constants.Color.blueDown.cgColor
    }
    
    func configure(with item: PaymentViewModel) {
        titleLabel.text = item.name
        setImage(url: item.imageUrl)
    }
}

extension PaymentItemCell {
    private func setImage(url: String) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
