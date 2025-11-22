//
//  DetailViewController.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 21.11.2025.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var reviewLabel: UILabel!

	var item: FavoriteItem?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let item = item else { return }
		
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
		reviewLabel.text = item.review
		itemImageView.image = UIImage(named: item.imageName)
	}
	
	private func setupData() {
		guard let item else { return }
		itemImageView.image = UIImage(named: item.imageName)
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
	}

}
