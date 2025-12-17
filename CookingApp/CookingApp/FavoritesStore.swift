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

    func add(_ meal: FavoriteMeal) {
        var all = getAll()
        guard !all.contains(meal) else { return }
        all.insert(meal, at: 0)
        save(all)
        notifyUpdated()
    }

    func remove(id: String) {
        var all = getAll()
        all.removeAll { $0.id == id }
        save(all)
        notifyUpdated()
    }

    func toggle(_ meal: FavoriteMeal) -> Bool {
        // returns new state: true if now favorite
        if isFavorite(id: meal.id) {
            remove(id: meal.id)
            return false
        } else {
            add(meal)
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
