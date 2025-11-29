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
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var reviewLabel: UILabel!
	
	var item: FavoriteItem?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		
		guard let item = item else { return }
		
		navigationItem.title = item.title

		itemImageView.image = UIImage(named: item.imageName) ?? UIImage(systemName: "photo")
		itemImageView.contentMode = .scaleAspectFill
		itemImageView.clipsToBounds = true
	
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
		descriptionLabel.text = item.description
		reviewLabel.text = item.review
		
		titleLabel.numberOfLines = 0
		subtitleLabel.numberOfLines = 0
		descriptionLabel.numberOfLines = 0
		reviewLabel.numberOfLines = 0
		
		titleLabel.lineBreakMode = .byWordWrapping
		subtitleLabel.lineBreakMode = .byWordWrapping
		descriptionLabel.lineBreakMode = .byWordWrapping
		reviewLabel.lineBreakMode = .byWordWrapping
	}
}
