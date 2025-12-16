//
//  ImageLoader.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//


import UIKit

final class ImageLoader {
	static let shared = ImageLoader()
	private let cache = NSCache<NSString, UIImage>()

	func load(_ urlString: String?, completion: @escaping (UIImage?) -> Void) {
		guard let urlString, let url = URL(string: urlString) else { completion(nil); return }

		if let img = cache.object(forKey: urlString as NSString) {
			completion(img); return
		}

		URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
			guard let data, let image = UIImage(data: data) else {
				DispatchQueue.main.async { completion(nil) }
				return
			}
			self?.cache.setObject(image, forKey: urlString as NSString)
			DispatchQueue.main.async { completion(image) }
		}.resume()
	}
}
