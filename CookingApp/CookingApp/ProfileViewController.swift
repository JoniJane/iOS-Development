//
//  ProfileViewController.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 18.12.2025.
//

import UIKit

final class ProfileViewController: UIViewController {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var actionButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"

		// 1) Шрифты
		let titleFont = UIFont(name: "HiraMinProN-W3", size: 22)
		let bodyFont  = UIFont(name: "HiraMinProN-W3", size: 16)
		let buttonFont = UIFont(name: "HiraMinProN-W3", size: 14)

		nameLabel.font = titleFont ?? .systemFont(ofSize: 22, weight: .semibold)
		emailLabel.font = bodyFont ?? .systemFont(ofSize: 16, weight: .regular)
		actionButton.titleLabel?.font = buttonFont ?? .systemFont(ofSize: 14, weight: .regular)

		// 2) Картинка
		// Если хочешь именно картинку из storyboard — УДАЛИ любой код, который меняет image.
		// Если хочешь задать из Assets:
		// profileImageView.image = UIImage(named: "profileAvatar")

		profileImageView.contentMode = .scaleAspectFill
		profileImageView.clipsToBounds = true
	}

	@IBAction func actionButtonTapped(_ sender: UIButton) {
		let ac = UIAlertController(title: "Profile", message: "Button tapped", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}
