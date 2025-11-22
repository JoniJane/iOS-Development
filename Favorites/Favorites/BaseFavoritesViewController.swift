//
//  BaseFavoritesViewController.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 20.11.2025.
//

import UIKit

class BaseFavoritesViewController: UIViewController {

	// allow setting category from storyboard
	@IBInspectable var categoryName: String?

	@IBOutlet weak var tableView: UITableView!
	var category: FavoriteCategory = .movies // default
	var items: [FavoriteItem] = []

	// Programmatic initializer (if needed)
	init(category: FavoriteCategory) {
		self.category = category
		super.init(nibName: nil, bundle: nil)
		self.title = category.title
	}

	// Storyboard/init from nib
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		// categoryName будет применён в viewDidLoad
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		// Настройка категории из storyboard
		if let name = categoryName?.lowercased() {
			switch name {
			case "movies", "movie": category = .movies
			case "music", "song": category = .music
			case "books", "book": category = .books
			case "courses", "course": category = .courses
			default: break
			}
		}

		self.title = category.title
		view.backgroundColor = .systemBackground
		setupTableView()
		items = SampleData.items(for: category)
	}

	private func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 80
	}
}

// MARK: - UITableViewDataSource
extension BaseFavoritesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseIdentifier, for: indexPath) as? FavoriteTableViewCell else {
			return UITableViewCell()
		}
		let item = items[indexPath.row]
		cell.configure(with: item)
		cell.accessoryType = .disclosureIndicator
		return cell
	}
}

// MARK: - UITableViewDelegate
extension BaseFavoritesViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let item = items[indexPath.row]

		// Создаём DetailViewController через Storyboard
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
			detailVC.item = item
			navigationController?.pushViewController(detailVC, animated: true)
		}
	}
}
