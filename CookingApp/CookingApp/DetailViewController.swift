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

				titleLabel.text = meal.strMeal

				let ing = meal.ingredients
				ingredientsTextView.text = ing.isEmpty ? "No ingredients" : "• " + ing.joined(separator: "\n• ")

				let instr = (meal.strInstructions ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
				instructionsTextView.text = instr.isEmpty ? "No instructions" : instr

				ImageLoader.shared.load(meal.strMealThumb) { [weak self] image in
					self?.recipeImageView.image = image
				}
			} catch {
				print("Detail error:", error)
			}
		}
	}
}
