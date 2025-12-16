//
//  Config.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//


import Foundation

enum Config {
    static var appId: String { value(for: "APP_ID") }
    static var appKey: String { value(for: "APP_KEY") }

    private static func value(for key: String) -> String {
        guard
            let url = Bundle.main.url(forResource: "EdamamKeys", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
            let value = dict[key] as? String,
            !value.isEmpty
        else { fatalError("Missing \(key) in EdamamKeys.plist") }
        return value
    }
}
