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
		
		itemImageView.contentMode = .scaleAspectFill
		itemImageView.clipsToBounds = true
		itemImageView.layer.cornerRadius = 8
		
		titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
		titleLabel.numberOfLines = 2
		
		subtitleLabel.font = UIFont.systemFont(ofSize: 13)
		subtitleLabel.numberOfLines = 2
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		itemImageView.image = nil
		titleLabel.text = nil
		subtitleLabel.text = nil
	}
	
	func configure(with item: FavoriteItem) {
		itemImageView.image = UIImage(named: item.imageName) ?? UIImage(systemName: "photo")
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
	}
}
