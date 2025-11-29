//
//  Model.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 20.11.2025.
//

import UIKit

struct FavoriteItem {
	let title: String
	let subtitle: String
	let description: String
	let review: String
	let imageName: String
}

enum FavoriteCategory {
	case movies
	case music
	case books
	case courses

	var title: String {
		switch self {
		case .movies: return "Movies"
		case .music: return "Music"
		case .books: return "Books"
		case .courses: return "Courses"
		}
	}
}
