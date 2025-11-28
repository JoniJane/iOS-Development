//
//  HeroAPI.swift
//  SuperheroRandomizer
//
//  Created by Zhanel Amanzhol on 28.11.2025.
//

import Foundation

enum HeroAPI {
	private static let baseURL = "https://akabab.github.io/superhero-api/api"

	static func randomID() -> Int {
		Int.random(in: 1...731)
	}

	static func fetchRandomHero(completion: @escaping (Result<Hero, Error>) -> Void) {
		let id = randomID()
		let urlString = "\(baseURL)/id/\(id).json"

		guard let url = URL(string: urlString) else {
			completion(.failure(NSError(domain: "BadURL", code: 0)))
			return
		}

		URLSession.shared.dataTask(with: url) { data, _, error in

			if let error = error {
				completion(.failure(error))
				return
			}

			guard let data = data else {
				completion(.failure(NSError(domain: "NoData", code: 0)))
				return
			}

			do {
				let hero = try JSONDecoder().decode(Hero.self, from: data)
				completion(.success(hero))
			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}
