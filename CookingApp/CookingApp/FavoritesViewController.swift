//
//  FavoritesViewController.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 16.12.2025.
//
import UIKit

final class FavoritesViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	private var items: [FavoriteMeal] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Favorites"

		tableView.dataSource = self
		tableView.delegate = self

		NotificationCenter.default.addObserver(self,
											   selector: #selector(reload),
											   name: .favoritesUpdated,
											   object: nil)
		reload()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		reload()
	}

	@objc private func reload() {
		items = FavoritesStore.shared.getAll()
		tableView.reloadData()
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
		let fav = items[indexPath.row]

		cell.dishNameLabel.text = fav.title
		cell.setFavorite(true)

		cell.dishImageView.image = nil
		ImageLoader.shared.load(fav.thumb) { image in
			if tableView.indexPath(for: cell) == indexPath {
				cell.dishImageView.image = image
			}
		}

		cell.onHeartTapped = { [weak self] in
			FavoritesStore.shared.remove(id: fav.id)
			self?.reload()
		}

		return cell
	}

	// swipe to remove
	func tableView(_ tableView: UITableView,
				   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let remove = UIContextualAction(style: .destructive, title: "Remove") { [weak self] _, _, done in
			guard let self else { done(true); return }
			let fav = self.items[indexPath.row]
			FavoritesStore.shared.remove(id: fav.id)
			self.reload()
			done(true)
		}
		return UISwipeActionsConfiguration(actions: [remove])
	}
}
