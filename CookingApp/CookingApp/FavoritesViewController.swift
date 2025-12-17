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
		tableView.allowsSelection = true

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

		cell.representedId = fav.id
		cell.dishImageView.image = UIImage(systemName: "photo")

		if let url = fav.thumb, !url.isEmpty {
			ImageLoader.shared.load(url) { image in
				DispatchQueue.main.async {
					if cell.representedId == fav.id {
						cell.dishImageView.image = image ?? UIImage(systemName: "photo")
					}
				}
			}
		}

		cell.onHeartTapped = { [weak self, weak cell] in
			guard let self else { return }

			// 1) UI сразу
			cell?.setFavorite(false)

			// 2) удаляем через задержку
			let idToRemove = fav.id
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
				guard let self else { return }

				// ВАЖНО: remove без уведомления, иначе reload() сработает мгновенно
				FavoritesStore.shared.remove(id: idToRemove, notify: false)

				guard let row = self.items.firstIndex(where: { $0.id == idToRemove }) else { return }
				self.items.remove(at: row)
				self.tableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .automatic)

				// теперь уведомим остальные экраны
				NotificationCenter.default.post(name: .favoritesUpdated, object: nil)
			}
		}

		return cell
	}

	// переход в Detail — ВНЕ cellForRowAt
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let fav = items[indexPath.row]
		let vc = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
		vc.mealId = fav.id
		navigationController?.pushViewController(vc, animated: true)
	}

	// swipe — ВНЕ cellForRowAt
	func tableView(_ tableView: UITableView,
				   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let remove = UIContextualAction(style: .destructive, title: "Remove") { [weak self] _, _, done in
			guard let self else { done(true); return }
			let fav = self.items[indexPath.row]
			FavoritesStore.shared.remove(id: fav.id)
			done(true)
		}

		return UISwipeActionsConfiguration(actions: [remove])
	}
}
