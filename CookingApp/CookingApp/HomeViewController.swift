//
//  HomeViewController.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//

import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!

	private let api = MealDBAPI()
	private var items: [MealDTO] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Cooking App"

		tableView.dataSource = self
		tableView.delegate = self

		searchBar.delegate = self
		searchBar.placeholder = "write the name of the dish..."
	}

	private func performSearch() {
		let q = (searchBar.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
		guard !q.isEmpty else { return }

		Task {
			do {
				let result = try await api.searchMeals(query: q)
				self.items = result
				self.tableView.reloadData()
			} catch {
				print("MealDB error:", error)
			}
		}
	}
}

extension HomeViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		performSearch()
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
		let item = items[indexPath.row]

		cell.dishNameLabel.text = item.strMeal
		cell.dishImageView.image = nil

		ImageLoader.shared.load(item.strMealThumb) { image in
			if tableView.indexPath(for: cell) == indexPath {
				cell.dishImageView.image = image
			}
		}

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let vc = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
		vc.mealId = items[indexPath.row].idMeal
		navigationController?.pushViewController(vc, animated: true)
	}
}
