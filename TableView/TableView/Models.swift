//
//  Models.swift
//  TableView
//
//  Created by Zhanel Amanzhol on 13.11.2025.
//

import UIKit

// 1. Модель для одного элемента (Movie, Book, etc.)
struct FavoriteItem {
	let title: String
	let subtitle: String
	let review: String
	let image: UIImage? // Опциональный, может быть SF Symbol или реальное изображение
}

// 2. Enum для секций (для лучшей организации кода)
enum SectionType: CaseIterable {
	case movies
	case music
	case books
	case universityCourses

	var title: String {
		switch self {
		case .movies: return "Favorite Movies"
		case .music: return "Favorite Music"
		case .books: return "Favorite Books"
		case .universityCourses: return "Favorite University Courses"
		}
	}
}

// 3. Модель для DataSource (основной массив данных)
struct Section {
	let type: SectionType
	let items: [FavoriteItem]
}
