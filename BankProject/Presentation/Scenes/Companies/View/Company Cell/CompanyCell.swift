//
//  CompanyCell.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 27.01.23.
//

import UIKit
import Kingfisher

class CompanyCell: UITableViewCell {

    // MARK: - Private IBOutlets

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    private func setupLayout() {
        lineView.customCornerView(cornerRadius: 7, borderWidth: 1, borderColor: Constants.Color.blueDown)
    }

    func configure(with item: CompanyViewModel) {
        titleLabel.text = item.name
        setImage(url: item.imageUrl)
    }
}

extension CompanyCell {
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

