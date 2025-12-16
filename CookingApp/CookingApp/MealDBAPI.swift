//
//  MealDBAPI.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//

import Foundation

enum MealDBError: Error {
	case badURL
	case badResponse
}

final class MealDBAPI {
	private let base = "https://www.themealdb.com/api/json/v1/1"

	// Поиск по названию: search.php?s=Arrabiata
	func searchMeals(query: String) async throws -> [MealDTO] {
		var components = URLComponents(string: "\(base)/search.php")
		components?.queryItems = [
			URLQueryItem(name: "s", value: query)
		]
		guard let url = components?.url else { throw MealDBError.badURL }

		let (data, response) = try await URLSession.shared.data(from: url)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw MealDBError.badResponse }

		let decoded = try JSONDecoder().decode(MealDBSearchResponse.self, from: data)
		return decoded.meals ?? []
	}

	// Детали по ID: lookup.php?i=52772
	func lookupMeal(id: String) async throws -> MealDTO? {
		var components = URLComponents(string: "\(base)/lookup.php")
		components?.queryItems = [URLQueryItem(name: "i", value: id)]
		guard let url = components?.url else { throw MealDBError.badURL }

		let (data, response) = try await URLSession.shared.data(from: url)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw MealDBError.badResponse }

		let decoded = try JSONDecoder().decode(MealDBSearchResponse.self, from: data)
		return decoded.meals?.first
	}
}
