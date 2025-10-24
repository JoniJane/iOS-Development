//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Zhanel Amanzhol on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	
	let animals = [
			("Dog", UIImage(named: "dog")),
			("Cat", UIImage(named: "cat")),
			("Lion", UIImage(named: "lion")),
			("Elephant", UIImage(named: "elephant")),
			("Tiger", UIImage(named: "tiger")),
			("Fox", UIImage(named: "fox")),
			("Panda", UIImage(named: "panda")),
			("Rabbit", UIImage(named: "rabbit")),
			("Wolf", UIImage(named: "wolf")),
			("Bear", UIImage(named: "bear"))
		]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		showRandomAnimal()
	}

	@IBAction func randomizeButtonTapped(_ sender: UIButton) {
		showRandomAnimal()
	}
	
	func showRandomAnimal() {
			let random = animals.randomElement()!
			titleLabel.text = random.0
			imageView.image = random.1
		}
}

