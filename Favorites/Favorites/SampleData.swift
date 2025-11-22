//
//  SampleData.swift
//  Favorites
//
//  Created by Zhanel Amanzhol on 22.11.2025.
//

import UIKit

struct SampleData {
	
	static func items(for category: FavoriteCategory) -> [FavoriteItem] {
		switch category {
		case .movies:
			return [
				FavoriteItem(title: "F1", subtitle: "Director: Joseph Kosinski", review: "Shows real pressure and danger behind Formula 1 racing. Rivals and discipline make it unforgettable.", imageName: "F1"),
				FavoriteItem(title: "The Social Network", subtitle: "Director: David Fincher", review: "About the creation of Facebook, ambition, friendship, and betrayal.", imageName: "The-social-network"),
				FavoriteItem(title: "Interstellar", subtitle: "Director: Christopher Nolan", review: "Connects science with emotional meaning. Father-daughter bond is powerful.", imageName: "interstellar"),
				FavoriteItem(title: "The Count of Monte Cristo", subtitle: "Director: Kevin Reynolds", review: "Story of revenge, justice, and personal transformation.", imageName: "monte-cristo"),
				FavoriteItem(title: "Spirited Away", subtitle: "Director: Hayao Miyazaki", review: "Fantasy and real emotional growth. Chihiro’s journey is inspiring.", imageName: "Spirited-Away"),
				FavoriteItem(title: "Inception", subtitle: "Director: Christopher Nolan", review: "Explores dreams and reality. Mind-bending and exciting.", imageName: "inception"),
				FavoriteItem(title: "Parasite", subtitle: "Director: Bong Joon-ho", review: "Social thriller with dark humor and clever plot twists.", imageName: "parasite"),
				FavoriteItem(title: "Joker", subtitle: "Director: Todd Phillips", review: "Psychological exploration of a man ignored by society.", imageName: "joker"),
				FavoriteItem(title: "The Matrix", subtitle: "Directors: Wachowski", review: "Sci-fi classic questioning reality and freedom.", imageName: "matrix"),
				FavoriteItem(title: "Coco", subtitle: "Director: Lee Unkrich", review: "Heartwarming story about family, music, and remembering loved ones.", imageName: "coco")
			]
			
		case .music:
			return [
				FavoriteItem(title: "This Is What Winter Feels Like", subtitle: "Artist: JVKE", review: "Cold, soft, emotional song describing loneliness.", imageName: "this-is-what-winter-feels-like"),
				FavoriteItem(title: "About You", subtitle: "Artist: The 1975", review: "Captures nostalgia and lingering memories.", imageName: "about-you"),
				FavoriteItem(title: "Sau Zhurek", subtitle: "Artist: Kunzharyq", review: "Raw and real emotions about unreturned love.", imageName: "sau-zhurek"),
				FavoriteItem(title: "Back to Friends", subtitle: "Artist: Sombr", review: "Calm song about relationships and timing.", imageName: "back-to-friends"),
				FavoriteItem(title: "Toxic Till the End", subtitle: "Artist: ROSÉ", review: "Honest portrayal of toxic relationships.", imageName: "toxic-till-the-end"),
				FavoriteItem(title: "Blinding Lights", subtitle: "Artist: The Weeknd", review: "Energetic song with nostalgic 80s vibes.", imageName: "blinding-lights"),
				FavoriteItem(title: "Levitating", subtitle: "Artist: Dua Lipa", review: "Fun, upbeat track that lifts your mood.", imageName: "levitating"),
				FavoriteItem(title: "Easy On Me", subtitle: "Artist: Adele", review: "Emotional ballad about forgiveness and growth.", imageName: "easy-on-me"),
				FavoriteItem(title: "Bad Habits", subtitle: "Artist: Ed Sheeran", review: "Catchy pop song with reflective lyrics.", imageName: "bad-habits"),
				FavoriteItem(title: "Shivers", subtitle: "Artist: Ed Sheeran", review: "Energetic track about excitement and love.", imageName: "shivers")
			]
			
		case .books:
			return [
				FavoriteItem(title: "Lessons in Chemistry", subtitle: "Author: Bonnie Garmus", review: "Main character fights societal limits. Inspiring mix of science and emotion.", imageName: "Lessons-in-Chemistry"),
				FavoriteItem(title: "When Breath Becomes Air", subtitle: "Author: Paul Kalanithi", review: "Reflects on life and death. Deeply moving.", imageName: "when-breath-becomes-air"),
				FavoriteItem(title: "The Alchemist", subtitle: "Author: Paulo Coelho", review: "About finding your own path. Symbolic yet personal.", imageName: "alchemist"),
				FavoriteItem(title: "The Power of Your Subconscious Mind", subtitle: "Author: Joseph Murphy", review: "Practical guide on mindset and habits.", imageName: "the-power"),
				FavoriteItem(title: "Martin Eden", subtitle: "Author: Jack London", review: "Shows the cost of ambition. Honest and tragic.", imageName: "Martin-Eden"),
				FavoriteItem(title: "Atomic Habits", subtitle: "Author: James Clear", review: "Practical strategies for building good habits.", imageName: "atomic-habits"),
				FavoriteItem(title: "Educated", subtitle: "Author: Tara Westover", review: "Memoir about education and self-discovery.", imageName: "educated"),
				FavoriteItem(title: "Sapiens", subtitle: "Author: Yuval Noah Harari", review: "History of humankind in a captivating way.", imageName: "sapiens"),
				FavoriteItem(title: "The Silent Patient", subtitle: "Author: Alex Michaelides", review: "Psychological thriller with a shocking twist.", imageName: "silent-patient"),
				FavoriteItem(title: "Normal People", subtitle: "Author: Sally Rooney", review: "Explores relationships, love, and growing up.", imageName: "normal-people")
			]
			
		case .courses:
			return [
				FavoriteItem(title: "UI/UX Design", subtitle: "Lecturer: D. Akhmetova", review: "Designing user-friendly interfaces. Teaches layout, usability, and design thinking.", imageName: "UIUX-design"),
				FavoriteItem(title: "Gamification & Game Design", subtitle: "Lecturer: A. Knysheva", review: "Core game mechanics and engagement principles.", imageName: "gamification-and-game-studies"),
				FavoriteItem(title: "Computer Networks", subtitle: "Instructor: A. Imanbaev", review: "Networking fundamentals and protocols.", imageName: "computer-networks"),
				FavoriteItem(title: "History of Kazakhstan", subtitle: "Professor: A. Zhumadil", review: "Key events and social development of Kazakhstan.", imageName: "history-of-kazakhstan"),
				FavoriteItem(title: "iOS Development", subtitle: "Lecturer: A. Myrzakanurov", review: "Hands-on Swift and UIKit programming.", imageName: "iOS-development"),
				FavoriteItem(title: "Database Systems", subtitle: "Lecturer: ", review: "Design and management of relational databases.", imageName: "database-systems"),
				FavoriteItem(title: "Software Engineering", subtitle: "Professor: J.Aldamuratov ", review: "Principles of software development life cycle.", imageName: "software-engineering"),
				FavoriteItem(title: "Machine Learning", subtitle: "Lecturer: K. Tulegen", review: "Introduction to ML concepts and algorithms.", imageName: "machine-learning"),
				FavoriteItem(title: "Cybersecurity Basics", subtitle: "Instructor: A. Nurgaliyev", review: "Fundamentals of security and data protection.", imageName: "cybersecurity"),
				FavoriteItem(title: "Mobile App Prototyping", subtitle: "Lecturer: D. Akhmetova", review: "Creating interactive prototypes for apps.", imageName: "mobile-prototyping")
			]
		}
	}
}
