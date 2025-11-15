//
//  ViewController.swift
//  TableView
//
//  Created by Zhanel Amanzhol on 12.11.2025.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - DataSource
		private let sections: [Section] = [
			Section(type: .movies, items: [
				FavoriteItem(title: "F1", subtitle: "Director: Joseph Kosinski", review: "I love this story because it shows the real pressure and danger behind Formula 1 racing. The rivalry and extreme discipline make the characters unforgettable. It motivates me with its intensity and dedication to excellence.", image: UIImage(named: "F1")),
				FavoriteItem(title: "The Social Network", subtitle: "Director: David Fincher", review: "I love this film because it shows the creation of Facebook and the conflicts behind success. It captures ambition, friendship, and betrayal in a very realistic way. It’s a favorite because it makes you think about innovation, ethics, and personal choices.", image: UIImage(named: "The-social-netwok")),
				FavoriteItem(title: "Interstellar", subtitle: "Director: Christopher Nolan", review: "This is one of my favorites because it connects science with deep emotional meaning. The bond between Cooper and his daughter makes the story powerful and human. It stays with you long after watching because of its ideas about love, time, and sacrifice.", image: UIImage(named: "interstellar")),
				FavoriteItem(title: "The Count of Monte Cristo", subtitle: "Director: Kevin Reynolds", review: "I love this film because it shows transformation, justice, and reclaiming your life. Edmond’s journey from betrayal to revenge feels incredibly satisfying to watch. The story motivates me with its themes of strength, patience, and destiny.", image: UIImage(named: "monte-cristo")),
				FavoriteItem(title: "Spirited Away", subtitle: "Director: Hayao Miyazaki", review: "This movie is special to me because it blends fantasy with real emotional growth. Chihiro’s journey from fear to confidence feels relatable and inspiring. Its world-building and gentle lessons make it unforgettable.", image: UIImage(named: "Spirited Away")),
			]),
			
			Section(type: .music, items: [
				FavoriteItem(title: "this is what winter feel like", subtitle: "Artist: JVKE", review: "The song feels cold, soft, and emotional. It describes loneliness in a gentle, relatable way. The vocals and production make it comforting.", image: UIImage(named: "this is what winter feel like")),
				FavoriteItem(title: "About You", subtitle: "Artist: The 1975", review: "This track captures nostalgia and lingering memories. The dreamy mood makes it easy to listen repeatedly. It’s a favorite for its emotional resonance.", image: UIImage(named: "about you")),
				FavoriteItem(title: "sau zhurek", subtitle: "Artist: Kunzharyq", review: "I love this song because it shows unreturned love perfectly. The emotions feel raw and real.It expresses heartbreak in a simple but powerful way.", image: UIImage(named: "sau zhurek")),
				FavoriteItem(title: "Back to Friends", subtitle: "Artist: sombr", review: "This song captures the moment two people can’t progress romantically. I love how calm and real it feels. It makes you reflect on timing and relationships.", image: UIImage(named: "back to friends")),
				FavoriteItem(title: "Toxic Till the End", subtitle: "Artist: ROSÉ", review: "I love this track for its honest portrayal of a toxic relationship. Rosé’s voice makes the emotion personal and strong. It’s painful, beautiful, and unforgettable.", image: UIImage(named: "toxic till the end"))
			]),

			Section(type: .books, items: [
				FavoriteItem(title: "Lessons in Chemistry", subtitle: "Author: Bonnie Garmus", review: "I love this book because the main character fights societal limits. Her intelligence and humor make it inspiring. It mixes science, emotion, and independence.", image: UIImage(named: "Lessons in Chemistry")),
				FavoriteItem(title: "When Breath Becomes Air", subtitle: "Author: Paul Kalanithi", review: "This book is powerful because it reflects on life and death honestly. Paul’s words are deeply human and moving. It changes how you view purpose and time.", image: UIImage(named: "when breath becomes air")),
				FavoriteItem(title: "The Alchemist", subtitle: "Author: Paulo Coelho", review: "I love this story because it’s about finding your own path. The journey feels symbolic yet personal. It inspires me to pursue my goals persistently.", image: UIImage(named: "alchemist")),
				FavoriteItem(title: "The Power of Your Subconscious Mind", subtitle: "Author: Joseph Murphy", review: "This book explains mindset in a practical way. It shows how thoughts shape habits and outcomes. It motivates me to stay positive and focused.", image: UIImage(named: "the power")),
				FavoriteItem(title: "Martin Eden", subtitle: "Author: Jack London", review: "I love this novel because it shows the cost of ambition. Martin’s struggle feels raw and real. It’s honest, tragic, and beautifully written.", image: UIImage(named: "Martin Eden"))
			]),
			
			Section(type: .universityCourses, items: [
				FavoriteItem(title: "UI/UX Design", subtitle: "Lecturer: D. Akhmetova",
					review: "A practical course on designing user-friendly interfaces. Teaches layout,usability, and design thinking.", image: UIImage(named: "UIUX design")),
				FavoriteItem(title: "Gamification & Game Design", subtitle: "Lecturer: A. Knysheva",
					review: "Introduces core game mechanics and design principles. Helps understand what makes games engaging.", image: UIImage(named: "gamification and game studies")),
				FavoriteItem(title: "Computer Networks", subtitle: "Instructor: A. Imanbaev",
					review: "Covers networking fundamentals and protocols. Essential for understanding data transfer and communication systems.", image: UIImage(named: "computer networks")),
				FavoriteItem(title: "History of Kazakhstan", subtitle: "Professor: A. Zhumadil",
					review: "Explores key events and social development. Provides context for modern Kazakhstan and its culture.", image: UIImage(named: "History of Kazakhstan")),
				
				FavoriteItem(title: "iOS Development", subtitle: "Lecturer: A. Myrzakanurov",
					review: "Hands-on programming with Swift and UIKit. Builds practical skills for creating real iOS apps.", image: UIImage(named: "iOS development"))
			])
		]

		// MARK: - Lifecycle
		override func viewDidLoad() {
			super.viewDidLoad()
			title = "My Favorites"
			
			// 1. Установка DataSource и Delegate
			tableView.dataSource = self
			tableView.delegate = self
			
			// 2. Настройка для динамической высоты ячеек
			tableView.rowHeight = UITableView.automaticDimension
			tableView.estimatedRowHeight = 120 // Повышает производительность
			
			// Убираем лишние линии внизу таблицы
			tableView.tableFooterView = UIView()
		}
	}

	// MARK: - UITableViewDataSource
	extension ViewController: UITableViewDataSource {
		
		// 1. Количество секций
		func numberOfSections(in tableView: UITableView) -> Int {
			return sections.count
		}
		
		// 2. Количество строк в секции
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return sections[section].items.count
		}
		
		// 3. Конфигурация ячейки
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath) as? FavoriteItemCell else {
				fatalError("Failed to dequeue FavoriteItemCell or cell identifier is wrong.")
			}
			
			let item = sections[indexPath.section].items[indexPath.row]
			cell.configure(with: item)
			
			return cell
		}
	}

	// MARK: - UITableViewDelegate (Включает Bonus Task: Custom Headers)
	extension ViewController: UITableViewDelegate {
		
		// MARK: - Bonus Task: Custom Header View
		func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
			let headerView = UIView()
		
			let label = UILabel()
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = sections[section].type.title
			label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
			label.textColor = .label
			
			headerView.addSubview(label)
			
			// Auto Layout для заголовка
			NSLayoutConstraint.activate([
				label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
				label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
				label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
				label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
			])
			
			return headerView
		}
		
		func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
			return 40
		}
		
		// Обработка нажатия на ячейку
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			tableView.deselectRow(at: indexPath, animated: true)
			let item = sections[indexPath.section].items[indexPath.row]
			print("Selected: \(item.title) from \(sections[indexPath.section].type.title)")
		}
		
		// Устанавливаем автоматическую высоту
		func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
			return UITableView.automaticDimension
		}
	}
