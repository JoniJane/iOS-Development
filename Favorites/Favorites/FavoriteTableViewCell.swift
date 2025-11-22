//
//  FavoriteTableViewCell.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 20.11.2025.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!

	static let reuseIdentifier = "FavoriteTableViewCell"
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		// Настройка ImageView
				itemImageView.contentMode = .scaleAspectFill
				itemImageView.clipsToBounds = true
				itemImageView.layer.cornerRadius = 8
				
				// Настройка titleLabel
				titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
				titleLabel.numberOfLines = 1
				titleLabel.lineBreakMode = .byTruncatingTail
				
				// Настройка subtitleLabel
				subtitleLabel.font = UIFont.systemFont(ofSize: 14)
				subtitleLabel.textColor = .secondaryLabel
				subtitleLabel.numberOfLines = 2
				subtitleLabel.lineBreakMode = .byTruncatingTail
		
    }

	func configure(with item: FavoriteItem) {
			itemImageView.image = UIImage(named: item.imageName)
			titleLabel.text = item.title
			subtitleLabel.text = item.subtitle
		}
    
}
