//
//  ViewController.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 20.11.2025.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Storyboard Param
	@IBInspectable var categoryName: String?
	
	// MARK: - Data
	var category: FavoriteCategory = .movies   // default
	var items: [FavoriteItem] = []

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureCategory()
		configureUI()
		setupTableView()
		
		items = SampleData.items(for: category)
	}

	// MARK: - Category Setup
	private func configureCategory() {
		if let name = categoryName?.lowercased() {
			switch name {
			case "movies", "movie":
				category = .movies
			case "music", "song":
				category = .music
			case "books", "book":
				category = .books
			case "courses", "course":
				category = .courses
			default:
				break
			}
		}
	}
	
	// MARK: - UI Setup
	private func configureUI() {
		title = category.title
		view.backgroundColor = .systemBackground
	}

	// MARK: - Table Setup
	private func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self

		tableView.rowHeight = 120
		tableView.estimatedRowHeight = 120
	}
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: FavoriteTableViewCell.reuseIdentifier,
			for: indexPath
		) as? FavoriteTableViewCell else {
			return UITableViewCell()
		}
		
		cell.configure(with: items[indexPath.row])
		cell.accessoryType = .disclosureIndicator
		
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)

		let item = items[indexPath.row]
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let detailVC = storyboard.instantiateViewController(
			withIdentifier: "DetailViewController"
		) as? DetailViewController {
			
			detailVC.item = item
			navigationController?.pushViewController(detailVC, animated: true)
		}
	}
}
