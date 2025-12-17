//
//  DetailViewController.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 16.12.2025.
//

import UIKit

final class DetailViewController: UIViewController {

	@IBOutlet weak var recipeImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var ingredientsTextView: UITextView!
	@IBOutlet weak var instructionsTextView: UITextView!

	var mealId: String!

	private let api = MealDBAPI()
	private var meal: MealDTO?   // чтобы держать данные для Favorites

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Detail"

		ingredientsTextView.isEditable = false
		instructionsTextView.isEditable = false

		loadDetail()
	}

	private func loadDetail() {
		Task {
			do {
				guard let meal = try await api.lookupMeal(id: mealId) else { return }
				self.meal = meal

				titleLabel.text = meal.strMeal

				let ing = meal.ingredients
				ingredientsTextView.text = ing.isEmpty ? "No ingredients"
					: "• " + ing.joined(separator: "\n• ")

				let instr = (meal.strInstructions ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
				instructionsTextView.text = instr.isEmpty ? "No instructions" : instr

				recipeImageView.image = nil
				ImageLoader.shared.load(meal.strMealThumb) { [weak self] image in
					self?.recipeImageView.image = image
				}

				updateHeartButton()
			} catch {
				print("Detail error:", error)
			}
		}
	}

	private func updateHeartButton() {
		guard let meal else { return }
		let isFav = FavoritesStore.shared.isFavorite(id: meal.idMeal)
		let imageName = isFav ? "heart.fill" : "heart"

		navigationItem.rightBarButtonItem = UIBarButtonItem(
			image: UIImage(systemName: imageName),
			style: .plain,
			target: self,
			action: #selector(didTapHeart)
		)
	}

	@objc private func didTapHeart() {
		guard let meal else { return }

		let fav = FavoriteMeal(id: meal.idMeal, title: meal.strMeal, thumb: meal.strMealThumb)
		_ = FavoritesStore.shared.toggle(fav)

		updateHeartButton()
	}
}

