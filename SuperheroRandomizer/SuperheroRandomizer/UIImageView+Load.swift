//
//  UIImageView+Load.swift
//  SuperheroRandomizer
//
//  Created by Zhanel Amanzhol on 28.11.2025.
//

import UIKit

extension UIImageView {
	func load(from url: URL?) {
		guard let url = url else {
			self.image = UIImage(systemName: "photo")
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, _, _ in
			guard let data = data,
				  let img = UIImage(data: data) else { return }
			
			DispatchQueue.main.async {
				self.image = img
			}
		}.resume()
	}
	
	func load(from urlString: String?) {
		let url = urlString.flatMap { URL(string: $0) }
		load(from: url)
	}
}
