//
//  FavoriteItemCell.swift
//  TableView
//
//  Created by Zhanel Amanzhol on 12.11.2025.
//

import UIKit

class FavoriteItemCell: UITableViewCell {

	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var reviewLabel: UILabel!
	
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
