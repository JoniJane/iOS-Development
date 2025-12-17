//
//  HomeViewController.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//
import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	private let api = MealDBAPI()
	private var items: [MealDTO] = []

	private let searchBar = UISearchBar(frame: .zero)

	override func viewDidLoad() {
		super.viewDidLoad()

		// Title + Search in NavBar
		navigationItem.title = "Cooking App"
		searchBar.placeholder = "write the name of the dish..."
		searchBar.showsCancelButton = true
		searchBar.delegate = self

		// кладём поисковик в навбар
		navigationItem.titleView = searchBar

		tableView.dataSource = self
		tableView.delegate = self

		NotificationCenter.default.addObserver(self,
											   selector: #selector(onFavoritesUpdated),
											   name: .favoritesUpdated,
											   object: nil)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}

	@objc private func onFavoritesUpdated() {
		tableView.reloadData()
	}

	private func performSearch() {
		let q = (searchBar.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
		guard !q.isEmpty else { return }

		Task { [weak self] in
			guard let self else { return }
			do {
				let result = try await api.searchMeals(query: q)
				self.items = result
				self.tableView.reloadData()

				if result.isEmpty {
					self.showAlert(title: "No results", message: "Try another dish name.")
				}
			} catch {
				print("MealDB error:", error)
				self.showAlert(title: "Error", message: "Could not load recipes. Check internet.")
			}
		}
	}

	private func toggleFavorite(for meal: MealDTO) {
		let fav = FavoriteMeal(id: meal.idMeal, title: meal.strMeal, thumb: meal.strMealThumb)
		_ = FavoritesStore.shared.toggle(fav)
	}

	private func showAlert(title: String, message: String) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		performSearch()
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.text = ""
		items = []
		tableView.reloadData()
		searchBar.resignFirstResponder()
	}
}

// MARK: - UITableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
		let item = items[indexPath.row]

		cell.dishNameLabel.text = item.strMeal
		cell.representedId = item.idMeal
		cell.dishImageView.image = UIImage(systemName: "photo")

		ImageLoader.shared.load(item.strMealThumb) { image in
			DispatchQueue.main.async {
				if cell.representedId == item.idMeal {
					cell.dishImageView.image = image ?? UIImage(systemName: "photo")
				}
			}
		}

		let isFav = FavoritesStore.shared.isFavorite(id: item.idMeal)
		cell.setFavorite(isFav)

		cell.onHeartTapped = { [weak self, weak tableView] in
			guard let self, let tableView else { return }
			self.toggleFavorite(for: item)
			tableView.reloadRows(at: [indexPath], with: .none)
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
