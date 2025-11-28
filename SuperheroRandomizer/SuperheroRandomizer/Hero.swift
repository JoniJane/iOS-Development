//
//  Hero.swift
//  SuperheroRandomizer
//
//  Created by Zhanel Amanzhol on 28.11.2025.
//

import Foundation

struct Hero: Decodable, Identifiable {
	let id: Int
	let name: String
	let powerstats: Powerstats
	let biography: Biography
	let images: HeroImages

	private enum CodingKeys: String, CodingKey {
		case id, name, powerstats, biography, images
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		id   = try container.decode(Int.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		
		// Если целый объект powerstats / biography / images вдруг null или отсутствует —
		// мы подставим "пустые" значения, чтобы не падать
		powerstats = try container.decodeIfPresent(Powerstats.self, forKey: .powerstats) ?? Powerstats()
		biography  = try container.decodeIfPresent(Biography.self,  forKey: .biography)  ?? Biography()
		images     = try container.decodeIfPresent(HeroImages.self, forKey: .images)     ?? HeroImages()
	}
	
	
	var displayFullName: String {
		let trimmed = biography.fullName.trimmingCharacters(in: .whitespacesAndNewlines)
		return trimmed.isEmpty ? name : trimmed
	}
	
	var displayAlignment: String {
		switch biography.alignment.lowercased() {
		case "good": return "Good"
		case "bad": return "Bad"
		case "neutral": return "Neutral"
		default: return "Unknown"
		}
	}
	
	var bestImageURL: URL? {
		let candidate = images.lg.isEmpty ? (images.md.isEmpty ? images.sm : images.md) : images.lg
		return URL(string: candidate)
	}
}

struct Powerstats: Decodable {
	let intelligence: Int
	let strength: Int
	let speed: Int
	let durability: Int
	let power: Int
	let combat: Int
	
	private enum CodingKeys: String, CodingKey {
		case intelligence, strength, speed, durability, power, combat
	}
	
	// "Пустой" конструктор для случаев, когда весь объект powerstats отсутствует.
	init(intelligence: Int = 0,
		 strength: Int = 0,
		 speed: Int = 0,
		 durability: Int = 0,
		 power: Int = 0,
		 combat: Int = 0) {
		self.intelligence = intelligence
		self.strength     = strength
		self.speed        = speed
		self.durability   = durability
		self.power        = power
		self.combat       = combat
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		intelligence = try container.decodeIfPresent(Int.self, forKey: .intelligence) ?? 0
		strength     = try container.decodeIfPresent(Int.self, forKey: .strength)     ?? 0
		speed        = try container.decodeIfPresent(Int.self, forKey: .speed)        ?? 0
		durability   = try container.decodeIfPresent(Int.self, forKey: .durability)   ?? 0
		power        = try container.decodeIfPresent(Int.self, forKey: .power)        ?? 0
		combat       = try container.decodeIfPresent(Int.self, forKey: .combat)       ?? 0
	}
}

struct Biography: Decodable {
	let fullName: String
	let alignment: String
	
	private enum CodingKeys: String, CodingKey {
		case fullName, alignment
	}
	
	init(fullName: String = "Unknown name",
		 alignment: String = "Unknown") {
		self.fullName  = fullName
		self.alignment = alignment
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		fullName  = try container.decodeIfPresent(String.self, forKey: .fullName)  ?? "Unknown name"
		alignment = try container.decodeIfPresent(String.self, forKey: .alignment) ?? "Unknown"
	}
}

struct HeroImages: Decodable {
	let sm: String
	let md: String
	let lg: String
	
	private enum CodingKeys: String, CodingKey {
		case sm, md, lg
	}
	
	init(sm: String = "", md: String = "", lg: String = "") {
		self.sm = sm
		self.md = md
		self.lg = lg
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		sm = try container.decodeIfPresent(String.self, forKey: .sm) ?? ""
		md = try container.decodeIfPresent(String.self, forKey: .md) ?? ""
		lg = try container.decodeIfPresent(String.self, forKey: .lg) ?? ""
	}
}
