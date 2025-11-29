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
			
		// MARK: - Movies
		case .movies:
			return [
				FavoriteItem(
					title: "F1",
					subtitle: "Director: Joseph Kosinski",
					description: "A drama about the intense and dangerous world of Formula 1 racing. The story follows drivers who risk their lives while dealing with pressure, rivalry and sacrifice. It highlights discipline, speed and the mental strength needed to compete.",
					review: "Grade: 9/10. My thoughts: I like how this movie shows the real pressure behind racing and how much dedication it takes.",
					imageName: "F1"
				),
				FavoriteItem(
					title: "The Social Network",
					subtitle: "Director: David Fincher",
					description: "A biographical drama about the creation of Facebook and the rise of Mark Zuckerberg. The film shows how a university project turns into a global company. It focuses on ambition, conflict, friendship and betrayal.",
					review: "Grade: 8.5/10. My thoughts: I enjoy how this movie makes me think about success, ethics and the cost of ambition.",
					imageName: "The social network"
				),
				FavoriteItem(
					title: "Interstellar",
					subtitle: "Director: Christopher Nolan",
					description: "A science-fiction epic about astronauts searching for a new home for humanity. The story explores space travel, black holes and time dilation. At its heart, it is also a story about a father-daughter relationship and love across time.",
					review: "Grade: 10/10. My thoughts: This film stays with me because it combines big scientific ideas with very emotional moments.",
					imageName: "interstellar"
				),
				FavoriteItem(
					title: "The Count of Monte Cristo",
					subtitle: "Director: Kevin Reynolds",
					description: "A historical adventure about Edmond Dantès, a man falsely imprisoned who escapes and reinvents himself. He carefully plans revenge on those who betrayed him. The film explores justice, transformation and the cost of vengeance.",
					review: "Grade: 9/10. My thoughts: I love watching his journey from victim to a powerful figure who takes back control of his life.",
					imageName: "monte-cristo"
				),
				FavoriteItem(
					title: "Spirited Away",
					subtitle: "Director: Hayao Miyazaki",
					description: "An animated fantasy about a girl named Chihiro who enters a mysterious spirit world. To save her parents, she must work, grow braver and learn responsibility. The film is full of symbols, magic and emotional growth.",
					review: "Grade: 10/10. My thoughts: This movie feels like a beautiful dream that quietly teaches courage and kindness.",
					imageName: "Spirited Away"
				),
				FavoriteItem(
					title: "Avatar: The Way of Water",
					subtitle: "Director: James Cameron",
					description: "A sci-fi sequel that returns to the world of Pandora, focusing on oceans and underwater tribes. The story follows Jake Sully and his family as they face new threats and try to protect their home. It mixes environmental themes with family, identity and survival.",
					review: "Grade: 10/10. My thoughts: I enjoy the stunning visuals and how the underwater world makes Pandora feel alive again.",
					imageName: "avatar"
				),
				FavoriteItem(
					title: "Shrek",
					subtitle: "Director: Andrew Adamson & Vicky Jenson",
					description: "An animated comedy about an ogre who wants to live alone in his swamp. He is forced to go on a quest to rescue a princess and slowly opens up to friendship and love. The film plays with classic fairy-tale clichés and turns them upside down.",
					review: "Grade: 9/10. My thoughts: I love how Shrek is both funny and sincere about accepting yourself as you are.",
					imageName: "shrek"
				),
				FavoriteItem(
					title: "The Hunger Games",
					subtitle: "Director: Gary Ross",
					description: "A dystopian story where teenagers are forced to fight to the death in a televised arena. Katniss Everdeen volunteers to save her sister and becomes a symbol of rebellion. The film explores survival, oppression and the power of media.",
					review: "Grade: 9/10. My thoughts: This movie makes me think about power, injustice and how one person can become a symbol.",
					imageName: "hunger games"
				),
				FavoriteItem(
					title: "The Grinch",
					subtitle: "Director: Ron Howard",
					description: "A holiday film about a grumpy creature who hates Christmas and plans to steal it from a cheerful town. Through the story he slowly discovers kindness and connection. The movie mixes comedy with a warm message about community and forgiveness.",
					review: "Grade: 8/10. My thoughts: I like watching his transformation from bitter and lonely to open and kind.",
					imageName: "grinch"
				),
				FavoriteItem(
					title: "Game of Thrones",
					subtitle: "Creators: David Benioff & D. B. Weiss",
					description: "A fantasy series set in a kingdom where powerful families fight for the Iron Throne. The story includes politics, war, dragons and morally gray characters. It is known for its complex plots, alliances and betrayals.",
					review: "Grade: 9/10. My thoughts: I find this series fascinating because it shows that power always has a price.",
					imageName: "got"
				)
			]
			
		// MARK: - Music
		case .music:
			return [
				FavoriteItem(
					title: "This Is What Winter Feels Like",
					subtitle: "Artist: JVKE",
					description: "A gentle and emotional song that captures the mood of a cold winter. The sound is soft, with echoing vocals and calm production. The lyrics describe loneliness, reflection and quiet sadness.",
					review: "Grade: 9/10. My thoughts: I love how this track makes me feel calm and reflective on winter evenings.",
					imageName: "this is what winter feels like"
				),
				FavoriteItem(
					title: "About You",
					subtitle: "Artist: The 1975",
					description: "A nostalgic song that feels like remembering someone from the past. The dreamy sound and echoing guitars create a hazy, emotional atmosphere. The lyrics focus on memories that never fully disappear.",
					review: "Grade: 9/10. My thoughts: I like this song because it sounds exactly like a memory you can’t let go of.",
					imageName: "about you"
				),
				FavoriteItem(
					title: "Sau Zhurek",
					subtitle: "Artist: Kunzharyq",
					description: "A Kazakh song that expresses the pain of unreturned love. The melody is emotional and powerful, and the vocals sound very sincere. The lyrics describe a heart that continues to love even when it hurts.",
					review: "Grade: 10/10. My thoughts: This song feels very real to me and perfectly captures the feeling of heartbreak.",
					imageName: "sau zhurek"
				),
				FavoriteItem(
					title: "Back to Friends",
					subtitle: "Artist: Sombr",
					description: "A calm, melancholic song about two people who cannot become more than friends. The lyrics describe the moment when romance fails and everything returns to the way it was. The music is soft and introspective.",
					review: "Grade: 8.5/10. My thoughts: I like how the song gently shows the sadness of almost having a relationship.",
					imageName: "back to friends"
				),
				FavoriteItem(
					title: "Toxic Till the End",
					subtitle: "Artist: ROSÉ",
					description: "A song about a relationship that is clearly unhealthy but still hard to leave. The lyrics talk about emotional chaos, attachment and repeated mistakes. The vocal performance is strong and emotional.",
					review: "Grade: 9/10. My thoughts: I appreciate how honestly this track portrays a toxic but addictive relationship.",
					imageName: "toxic-till-the-end"
				),
				FavoriteItem(
					title: "Timeless",
					subtitle: "Artist: The Weeknd & Playboi Carti",
					description: "A dark, stylish song about confidence, fame and a luxurious lifestyle. The lyrics mention success, relationships and the sense of being unforgettable. The production has a heavy, hypnotic energy.",
					review: "Grade: 8/10. My thoughts: I enjoy this track mainly for its bold vibe and nighttime energy.",
					imageName: "timeless"
				),
				FavoriteItem(
					title: "Cтань судьбой",
					subtitle: "Artist: The Tetsoo, The Adresov",
					description: "A romantic song about wanting someone to become your destiny. The lyrics speak about standing together through different moments and sharing a future. The melody is emotional and warm.",
					review: "Grade: 8.5/10. My thoughts: I like how sincere and hopeful this song feels about love and partnership.",
					imageName: "adresov"
				),
				FavoriteItem(
					title: "Remember Me",
					subtitle: "Artist: d4vd, Arcane & League of Legends",
					description: "A dark, cinematic song connected to the Arcane universe. The lyrics describe drifting apart, pain and the fear of being forgotten. The music feels like a soundtrack to an intense emotional story.",
					review: "Grade: 9/10. My thoughts: I enjoy this song because it sounds like a whole movie in just a few minutes.",
					imageName: "arcane"
				),
				FavoriteItem(
					title: "HONEY (ARE U COMING?)",
					subtitle: "Artist: Måneskin",
					description: "A rock song with fast rhythm and strong guitar sound. The lyrics talk about meeting someone who feels just as lost and restless. It invites them to join an unknown but exciting journey.",
					review: "Grade: 8.5/10. My thoughts: I like the energy of this track and how it mixes chaos with connection.",
					imageName: "moneskin"
				),
				FavoriteItem(
					title: "Ауырмайды жүрек",
					subtitle: "Artist: Kairat Nurtas",
					description: "A well-known Kazakh song about heartbreak and emotional pain. It describes long nights, memories and the heaviness of separation. The melody is expressive and easy to recognize.",
					review: "Grade: 10/10. My thoughts: This song feels timeless and always touches me when I listen to it.",
					imageName: "kairosh"
				)
			]
			
		// MARK: - Books
		case .books:
			return [
				FavoriteItem(
					title: "Lessons in Chemistry",
					subtitle: "Author: Bonnie Garmus",
					description: "A novel about Elizabeth Zott, a brilliant chemist in the 1960s facing sexism and prejudice. She unexpectedly becomes a TV cooking show host and uses it to teach science and independence. The book blends humor, social critique and emotional moments.",
					review: "Grade: 9/10. My thoughts: I love how Elizabeth challenges expectations and refuses to accept limiting roles.",
					imageName: "Lessons-in-Chemistry"
				),
				FavoriteItem(
					title: "When Breath Becomes Air",
					subtitle: "Author: Paul Kalanithi",
					description: "A memoir written by a neurosurgeon diagnosed with terminal cancer. He reflects on his life, work and the meaning of facing death at a young age. The book explores purpose, identity and what it means to live well.",
					review: "Grade: 10/10. My thoughts: This book deeply moved me and made me think about how I want to use my time.",
					imageName: "when-breath-becomes-air"
				),
				FavoriteItem(
					title: "The Alchemist",
					subtitle: "Author: Paulo Coelho",
					description: "An allegorical story about a shepherd named Santiago searching for a hidden treasure. On his journey he meets different people and learns about destiny, intuition and following his personal legend. The book is simple but full of philosophical ideas.",
					review: "Grade: 8.5/10. My thoughts: I like how this story gently reminds me to listen to my dreams and keep moving.",
					imageName: "alchemist"
				),
				FavoriteItem(
					title: "The Power of Your Subconscious Mind",
					subtitle: "Author: Joseph Murphy",
					description: "A self-help book about how our thoughts and beliefs influence our reality. It focuses on visualization, affirmations and building positive mental patterns. The author combines spiritual ideas with practical advice.",
					review: "Grade: 8/10. My thoughts: This book encourages me to pay more attention to my inner dialogue and mindset.",
					imageName: "the-power-"
				),
				FavoriteItem(
					title: "Martin Eden",
					subtitle: "Author: Jack London",
					description: "A novel about a poor young sailor who wants to become an educated writer. He struggles with class barriers, rejection and his own self-worth. The story explores ambition, society and personal identity.",
					review: "Grade: 9/10. My thoughts: This book feels raw and honest about the sacrifices and pain behind big dreams.",
					imageName: "Martin Eden"
				),
				FavoriteItem(
					title: "Atomic Habits",
					subtitle: "Author: James Clear",
					description: "A practical guide to building good habits and breaking bad ones through small changes. The book explains how systems are more important than goals and how environment shapes behavior. It includes many examples and simple frameworks.",
					review: "Grade: 10/10. My thoughts: I like this book because it makes self-improvement feel realistic and manageable.",
					imageName: "atomic"
				),
				FavoriteItem(
					title: "The Picture of Dorian Gray",
					subtitle: "Author: Oscar Wilde",
					description: "A gothic novel about a young man whose portrait ages while he stays eternally beautiful. Dorian lives a life of pleasure and cruelty without visible consequences. The story explores vanity, morality and corruption.",
					review: "Grade: 8/10. My thoughts: I enjoy how this book shows the dark side of caring only about appearance and desire.",
					imageName: "dorian"
				),
				FavoriteItem(
					title: "The Life-Changing Magic of Tidying Up",
					subtitle: "Author: Marie Kondo",
					description: "A guide to decluttering your home using the KonMari method. It teaches you to keep only items that truly spark joy and organize them carefully. The book connects physical order with emotional clarity and peace.",
					review: "Grade: 8.5/10. My thoughts: This book inspires me to treat my space more intentionally and let go of unnecessary things.",
					imageName: "magic"
				),
				FavoriteItem(
					title: "Five Feet Apart",
					subtitle: "Authors: Rachael Lippincott, Mikki Daughtry, Tobias Iaconis",
					description: "A contemporary YA novel about two teenagers with cystic fibrosis who must stay physically apart. Despite the distance they develop a deep emotional connection. The story explores illness, love and the limits placed on their lives.",
					review: "Grade: 8/10. My thoughts: I find this story touching because it shows both hope and frustration in a realistic way.",
					imageName: "five feet apart"
				),
				FavoriteItem(
					title: "Memoirs of a Geisha",
					subtitle: "Author: Arthur Golden",
					description: "A historical novel following a girl who becomes a geisha in pre-war Japan. It describes her training, performances and relationships within a competitive and controlled world. The book mixes cultural detail with an emotional personal story.",
					review: "Grade: 9/10. My thoughts: I like how this novel is both visually rich and emotionally heavy at the same time.",
					imageName: "geisha"
				)
			]
			
		// MARK: - Courses
		case .courses:
			return [
				FavoriteItem(
					title: "UI/UX Design",
					subtitle: "Lecturer: D. Akhmetova",
					description: "A course about designing user-friendly digital interfaces for apps and websites. It covers layout, hierarchy, color, typography and user flows. Students also practice prototyping and thinking from the user’s perspective.",
					review: "Grade: 9/10. My thoughts: I enjoy this course because it combines creativity with logical problem solving.",
					imageName: "UI:UX design"
				),
				FavoriteItem(
					title: "Gamification & Game Design",
					subtitle: "Lecturer: A. Knysheva",
					description: "A course introducing core game mechanics, player motivation and interactive storytelling. It explains how to design engaging systems, not just full games. Students explore how games and gamification can be used in different fields.",
					review: "Grade: 9/10. My thoughts: I like how it shows that game thinking can improve learning and product design.",
					imageName: "gamification-and-game-studies"
				),
				FavoriteItem(
					title: "Computer Networks",
					subtitle: "Instructor: A. Imanbaev",
					description: "A technical course on how computers communicate over local and global networks. It covers network layers, protocols, IP addressing and routing. Students learn how data travels securely and efficiently between devices.",
					review: "Grade: 8/10. My thoughts: This course helped me finally understand what really happens behind Wi-Fi and the internet.",
					imageName: "computer-networks"
				),
				FavoriteItem(
					title: "History of Kazakhstan",
					subtitle: "Professor: A. Zhumadil",
					description: "A humanities course covering key periods and events in the history of Kazakhstan. It looks at political changes, cultural development and social movements. The course connects historical events with modern identity and society.",
					review: "Grade: 8.5/10. My thoughts: I appreciate this course because it gives context to the place where I live and study.",
					imageName: "History of Kazakhstan"
				),
				FavoriteItem(
					title: "iOS Development",
					subtitle: "Lecturer: A. Myrzakanurov",
					description: "A practical programming course focused on building apps for Apple devices using Swift and UIKit/SwiftUI. Students learn about views, navigation, networking and data storage. The course includes hands-on projects and real app examples.",
					review: "Grade: 9.5/10. My thoughts: I love this course because I can see my code turn into real, working applications.",
					imageName: "iOS-development"
				),
				FavoriteItem(
					title: "Professional Kazakh Language",
					subtitle: "Lecturer: Department of Kazakh Language",
					description: "A course that develops academic and professional language skills in Kazakh. It focuses on structured writing, formal communication and public speaking. Students practice using Kazakh in official, educational and workplace situations.",
					review: "Grade: 10/10. My thoughts: I value this course because it helps me feel more confident in formal Kazakh contexts.",
					imageName: "kazak tili"
				),
				FavoriteItem(
					title: "Power BI",
					subtitle: "Lecturer: T. Savina",
					description: "A data analytics course centered on Microsoft Power BI. Students learn how to import, clean and model data from different sources. They create interactive dashboards and reports to support data-driven decisions.",
					review: "Grade: 10/10. My thoughts: I like this course because it turns raw data into clear and visual stories.",
					imageName: "power bi"
				),
				FavoriteItem(
					title: "Databases",
					subtitle: "Lecturer: A. Kuralbaev",
					description: "A course about designing and working with relational databases. It covers SQL, table structure, normalization and indexing. Students practice writing queries and building schemas for real applications.",
					review: "Grade: 8.5/10. My thoughts: This course gave me a strong foundation for understanding how data is stored in most systems.",
					imageName: "databases"
				),
				FavoriteItem(
					title: "Object-Oriented Programming and Design",
					subtitle: "Professor: P. Shamoi",
					description: "A programming course focused on objects, classes, inheritance and polymorphism. It teaches how to design modular, reusable and maintainable code. Students also get introduced to basic design patterns and OOP principles.",
					review: "Grade: 10/10. My thoughts: I appreciate this course because it changed how I think about structuring code.",
					imageName: "oop"
				),
				FavoriteItem(
					title: "Cyber Security Fundamentals",
					subtitle: "Lecturer: Cybersecurity Department",
					description: "An introductory course on protecting information and systems from digital attacks. It covers common threats, basic encryption, authentication and safe practices. Real examples show how vulnerabilities appear in networks and applications.",
					review: "Grade: 8/10. My thoughts: This course made me more careful and aware of how easily data can be exposed online.",
					imageName: "cybersecurity"
				)
			]
		}
	}
}
