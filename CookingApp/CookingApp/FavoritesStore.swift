//
//  FavoritesStore.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//

import Foundation

final class FavoritesStore {
	static let shared = FavoritesStore()
	private init() {}

	private let key = "favorite_meals"

	func getAll() -> [FavoriteMeal] {
		guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
		return (try? JSONDecoder().decode([FavoriteMeal].self, from: data)) ?? []
	}

	func isFavorite(id: String) -> Bool {
		getAll().contains(where: { $0.id == id })
	}

	func add(_ meal: FavoriteMeal, notify: Bool = true) {
		var all = getAll()
		guard !all.contains(meal) else { return }
		all.insert(meal, at: 0)
		save(all)
		if notify { notifyUpdated() }
	}

	func remove(id: String, notify: Bool = true) {
		var all = getAll()
		all.removeAll { $0.id == id }
		save(all)
		if notify { notifyUpdated() }
	}

	func toggle(_ meal: FavoriteMeal, notify: Bool = true) -> Bool {
		if isFavorite(id: meal.id) {
			remove(id: meal.id, notify: notify)
			return false
		} else {
			add(meal, notify: notify)
			return true
		}
	}

	private func save(_ all: [FavoriteMeal]) {
		let data = try? JSONEncoder().encode(all)
		UserDefaults.standard.set(data, forKey: key)
	}

	private func notifyUpdated() {
		NotificationCenter.default.post(name: .favoritesUpdated, object: nil)
	}
}

extension Notification.Name {
	static let favoritesUpdated = Notification.Name("favoritesUpdated")
}
