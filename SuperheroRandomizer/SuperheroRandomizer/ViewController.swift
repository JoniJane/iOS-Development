//
//  ViewController.swift
//  SuperheroRandomizer
//
//  Created by Zhanel Amanzhol on 28.11.2025.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var heroImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var alignmentLabel: UILabel!
	@IBOutlet weak var randomButton: UIButton!
	@IBOutlet weak var loader: UIActivityIndicatorView!
	@IBOutlet weak var statsStackView: UIStackView!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Hero Randomizer"
		loader.hidesWhenStopped = true
		loadRandomHero()
	}
	
	@IBAction func randomPressed(_ sender: UIButton) {
		loadRandomHero()
	}
	
	private func loadRandomHero() {
		loader.startAnimating()
		randomButton.isEnabled = false

		HeroAPI.fetchRandomHero { [weak self] result in
			DispatchQueue.main.async {
				guard let self = self else { return }

				switch result {
				case .success(let hero):
					self.loader.stopAnimating()
					self.randomButton.isEnabled = true
					self.updateUI(hero)

				case .failure(let error):
					if error is DecodingError {
						print("DecodingError, trying another hero…")
						// не включаем кнопку и не останавливаем спиннер — просто ещё один запрос
						self.loadRandomHero()
					} else {
						// реальная сетевая ошибка — показываем алёрт
						self.loader.stopAnimating()
						self.randomButton.isEnabled = true
						self.showError(error)
					}
				}
			}
		}
	}
	
	private func updateUI(_ hero: Hero) {
		nameLabel.text = hero.name
		fullNameLabel.text = hero.displayFullName
		alignmentLabel.text = hero.displayAlignment

		let stats = hero.powerstats
		statsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		statsStackView.addArrangedSubview(StatsView(title: "Intelligence", value: stats.intelligence))
		statsStackView.addArrangedSubview(StatsView(title: "Strength",     value: stats.strength))
		statsStackView.addArrangedSubview(StatsView(title: "Speed",        value: stats.speed))
		statsStackView.addArrangedSubview(StatsView(title: "Durability",   value: stats.durability))
		statsStackView.addArrangedSubview(StatsView(title: "Power",        value: stats.power))
		statsStackView.addArrangedSubview(StatsView(title: "Combat",       value: stats.combat))

		heroImageView.load(from: hero.bestImageURL)
	}
	
	private func showError(_ error: Error) {
		let alert = UIAlertController(
			title: "Error",
			message: error.localizedDescription,
			preferredStyle: .alert
		)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}
