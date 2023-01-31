//
//  OfferItemCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 17.01.23.
//

import UIKit
import Kingfisher

class OfferItemCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: Life Cyrcle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        layer.cornerRadius = 7
    }
    
    func configure(with item: OfferViewModel) {
        setImage(url: item.imageUrl)
        titleLabel.text = item.title
        contentLabel.text = item.content
    }
}

extension OfferItemCell {
    private func setImage(url: String) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: picture.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        picture.kf.indicatorType = .activity
        picture.kf.setImage(
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
