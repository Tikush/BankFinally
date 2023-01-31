//
//  CategoryCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 22.01.23.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    // MARK: - Private IBOutlets

    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    private func setupLayout() {
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }

    func configure(with item: CategoryViewModel) {
        titleLabel.text = item.name
        setImage(url: item.imageUrl)
    }
}

extension CategoryCell {
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
