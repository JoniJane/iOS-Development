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
//
//struct SampleData {
//	static func items(for category: FavoriteCategory) -> [FavoriteItem] {
//		switch category {
//		case .movies:
//			return [
//				FavoriteItem(title: "Inception", subtitle: "Sci-fi Thriller", review: "Brilliant mind-bending film", imageName: "film"),
//				FavoriteItem(title: "Interstellar", subtitle: "Sci-fi Drama", review: "Deep and emotional", imageName: "sparkles")
//			]
//		case .music:
//			return [
//				FavoriteItem(title: "The Weeknd", subtitle: "Blinding Lights", review: "Top-chart hit", imageName: "music.note"),
//				FavoriteItem(title: "Imagine Dragons", subtitle: "Believer", review: "Energetic track", imageName: "flame")
//			]
//		case .books:
//			return [
//				FavoriteItem(title: "1984", subtitle: "George Orwell", review: "Classic dystopia", imageName: "book"),
//				FavoriteItem(title: "Atomic Habits", subtitle: "James Clear", review: "Life-changing book", imageName: "lightbulb")
//			]
//		case .courses:
//			return [
//				FavoriteItem(title: "iOS Development", subtitle: "UIKit + Swift", review: "Learn mobile apps", imageName: "iphone"),
//				FavoriteItem(title: "UI/UX Design", subtitle: "Human-centered UX", review: "Perfect for creatives", imageName: "pencil")
//			]
//		}
//	}
//}
