//
//  RecipeCell.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 16.12.2025.
//

import UIKit

final class RecipeCell: UITableViewCell {
	@IBOutlet weak var dishImageView: UIImageView!
	@IBOutlet weak var dishNameLabel: UILabel!
	@IBOutlet weak var heartButton: UIButton!

	var onHeartTapped: (() -> Void)?
	var representedId: String?

	@IBAction func heartTapped(_ sender: UIButton) {
		onHeartTapped?()
	}

	func setFavorite(_ isFav: Bool) {
		let name = isFav ? "heart.fill" : "heart"
		heartButton.setImage(UIImage(systemName: name), for: .normal)
		heartButton.isUserInteractionEnabled = true
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		onHeartTapped = nil
		representedId = nil
		dishImageView.image = UIImage(systemName: "photo")
	}
}
