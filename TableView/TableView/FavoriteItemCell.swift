//
//  FavoriteItemCell.swift
//  TableView
//
//  Created by Zhanel Amanzhol on 12.11.2025.
//

import UIKit

class FavoriteItemCell: UITableViewCell {

	@IBOutlet private weak var itemImageView: UIImageView!
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var subtitleLabel: UILabel!
	@IBOutlet private weak var reviewLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	func configure(with item: FavoriteItem) {
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
		reviewLabel.text = item.review
		itemImageView.image = item.image ?? UIImage(systemName: "photo") // Fallback
	}
}
