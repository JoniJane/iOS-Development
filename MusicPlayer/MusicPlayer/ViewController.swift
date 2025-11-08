//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Zhanel Amanzhol on 05.11.2025.
//

import UIKit
import AVFoundation

struct TrackItem {
	let title: String
	let artist: String
	let cover: UIImage
	let audioFile: String // имя файла без .mp3
}

class ViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var backgroundImageView: UIImageView! // один UIImageView для фона
	@IBOutlet weak var trackCover: UIImageView!
	@IBOutlet weak var trackTitle: UILabel!
	@IBOutlet weak var artistLabel: UILabel!
	@IBOutlet weak var playPauseButton: UIButton!
	@IBOutlet weak var prevButton: UIButton!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var shuffleButton: UIButton!
	@IBOutlet weak var repeatButton: UIButton!
	@IBOutlet weak var progressView: UIProgressView!
	@IBOutlet weak var currentTimeLabel: UILabel!
	@IBOutlet weak var durationLabel: UILabel!

	// MARK: - Player state
	private var player: AVAudioPlayer?
	private var currentIndex = 0
	private var isPlaying = false
	private var isShuffleEnabled = false
	/// 0 = off, 1 = repeat one, 2 = repeat all
	private var repeatMode = 0
	private var isDarkMode = false
	private var timer: Timer?

	// MARK: - Tracks
	private let tracks: [TrackItem] = [
		TrackItem(title: "Lose My Mind",
				  artist: "Don Toliver feat. Doja Cat",
				  cover: UIImage(named: "lose my mind") ?? UIImage(),
				  audioFile: "Don_Toliver_feat_Doja_Cat_-_Lose_My_Mind_79210925"),
		TrackItem(title: "This is what winter feel like",
				  artist: "Jvke",
				  cover: UIImage(named: "this is what winter feel like") ?? UIImage(),
				  audioFile: "Jvke_-_This_is_what_winter_feel_like_77304494"),
		TrackItem(title: "Sau zhurek",
				  artist: "Kunzharyq",
				  cover: UIImage(named: "sau zhurek") ?? UIImage(),
				  audioFile: "kunzharyq-sau-zhurek"),
		TrackItem(title: "Back to friends",
				  artist: "Sombr",
				  cover: UIImage(named: "back to friends") ?? UIImage(),
				  audioFile: "sombr_-_back_to_friends_79149355"),
		TrackItem(title: "About you",
				  artist: "The 1975",
				  cover: UIImage(named: "about you") ?? UIImage(),
				  audioFile: "The_1975_-_About_You_74951600"),
		TrackItem(title: "Pretty Boy",
				  artist: "The Neighbourhood",
				  cover: UIImage(named: "pretty boy") ?? UIImage(),
				  audioFile: "The_Neighbourhood_-_Pretty_Boy_74911490"),
		TrackItem(title: "Toxic Till The End",
				  artist: "Rose",
				  cover: UIImage(named: "toxic till the end") ?? UIImage(),
				  audioFile: "Rose_-_Toxic_Till_The_End_79018866"),
		TrackItem(title: "Suzume",
				  artist: "RADWIMPS feat. Toaka",
				  cover: UIImage(named: "suzume") ?? UIImage(),
				  audioFile: "RADWIMPS_-_Suzume_feat_toaka_74751627"),
		TrackItem(title: "Sailor Song",
				  artist: "Gigi Perez",
				  cover: UIImage(named: "sailor song") ?? UIImage(),
				  audioFile: "Gigi_Perez_-_Sailor_Song_78255861"),
		TrackItem(title: "Plastic Sezimder",
				  artist: "Asiya / Jeltoksan",
				  cover: UIImage(named: "plastic sezimder") ?? UIImage(),
				  audioFile: "jeltoksan_Asiya_-_Plastic_Sezimder_75073317")
	]

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// защита от конфигурации кнопки (чтобы iOS не применял свой tint/filled)
		playPauseButton.configuration = nil
		shuffleButton.configuration = nil
		repeatButton.configuration = nil
		prevButton.configuration = nil
		nextButton.configuration = nil

		// UI initial
		progressView.progress = 0
		currentTimeLabel.text = "0:00"
		durationLabel.text = "--:--"
		setupButtonsAppearance()
		updateUI()

		// prepare first track if exists
		prepareCurrentTrack()
	}

	// MARK: - UI helpers
	private func setupButtonsAppearance() {
		// установить начальные иконки
		playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
		shuffleButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
		repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
		prevButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
		nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)

		// ensure tint uses label color so it adapts to light/dark
		[playPauseButton, shuffleButton, repeatButton, prevButton, nextButton].forEach {
			$0?.tintColor = .label
		}
	}

	private func updateUI() {
		// обновить метки и обложку
		let track = tracks[currentIndex]
		trackTitle.text = track.title
		artistLabel.text = track.artist
		trackCover.image = track.cover

		// progress/time reset until player prepared
		progressView.progress = 0
		currentTimeLabel.text = "0:00"
		durationLabel.text = "--:--"
	}

	// MARK: - Player control & loading
	private func prepareCurrentTrack() {
		stopTimer()
		player = nil

		let audioName = tracks[currentIndex].audioFile
		// если файлы в подпапке playlist — ищем там; иначе попробуй в основном bundle
		var url: URL?
		if let p = Bundle.main.path(forResource: audioName, ofType: "mp3", inDirectory: "playlist") {
			url = URL(fileURLWithPath: p)
		} else {
			url = Bundle.main.url(forResource: audioName, withExtension: "mp3")
		}

		guard let soundUrl = url else {
			print("Audio not found for: \(audioName)")
			return
		}

		do {
			player = try AVAudioPlayer(contentsOf: soundUrl)
			player?.delegate = self
			player?.prepareToPlay()
			durationLabel.text = formatTime(player?.duration ?? 0)
		} catch {
			print("Error creating player: \(error)")
			player = nil
		}
	}

	private func playCurrentTrack(startFromBeginning: Bool = false) {
		if player == nil { prepareCurrentTrack() }
		guard let player = player else { return }
		if startFromBeginning { player.currentTime = 0 }
		player.play()
		isPlaying = true
		startTimer()
		animatePlayPauseIcon()
	}

	private func pauseCurrentTrack() {
		player?.pause()
		isPlaying = false
		stopTimer()
		animatePlayPauseIcon()
	}

	// MARK: - Actions (подключи в storyboard)
	@IBAction func playPauseTapped(_ sender: UIButton) {
		if player == nil {
			prepareCurrentTrack()
			playCurrentTrack()
		} else {
			if isPlaying { pauseCurrentTrack() } else { playCurrentTrack() }
		}
	}

	@IBAction func nextTapped(_ sender: UIButton) {
		animateTap(sender)
		goToNextTrack()
	}

	@IBAction func prevTapped(_ sender: UIButton) {
		animateTap(sender)
		goToPreviousTrack()
	}

	@IBAction func shuffleTapped(_ sender: UIButton) {
		// 1. Инвертируем состояние перемешивания
		isShuffleEnabled.toggle()
		
		// 2. Анимируем нажатие
		animateTap(sender)

		// 3. Обновляем внешний вид кнопки
		if isShuffleEnabled {
			// Shuffle включен
			shuffleButton.setImage(UIImage(systemName: "shuffle.circle.fill"), for: .normal)
			shuffleButton.tintColor = .systemGreen
		} else {
			// Shuffle выключен
			shuffleButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
			shuffleButton.tintColor = .label
			
			// Опционально: можно сбросить currentIndex на 0 или на предыдущий трек,
			// но для простоты просто продолжаем воспроизведение с текущего трека.
		}
	}

	@IBAction func repeatTapped(_ sender: UIButton) {
		repeatMode = (repeatMode + 1) % 3
		// 0 off, 1 repeat one, 2 repeat all
		switch repeatMode {
		case 0:
			repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
			repeatButton.tintColor = .label
		case 1:
			repeatButton.setImage(UIImage(systemName: "repeat.1"), for: .normal)
			repeatButton.tintColor = .systemGreen
		case 2:
			repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
			repeatButton.tintColor = .systemGreen
		default:
			break
		}
	}
	@IBAction func themeToggleButtonTapped(_ sender: UIButton) {
		isDarkMode.toggle()
		let imageName = isDarkMode ? "dark" : "light"
		// плавный переход картинки
		UIView.transition(with: backgroundImageView,
						  duration: 0.35,
						  options: .transitionCrossDissolve,
						  animations: { self.backgroundImageView.image = UIImage(named: imageName) },
						  completion: nil)
	}

	// MARK: - Track navigation logic
	private func goToNextTrack() {
		stopTimer()
		if isShuffleEnabled {
			// случайный индекс, но не равный текущему (если есть >1 трек)
			if tracks.count > 1 {
				var newIndex: Int
				repeat {
					newIndex = Int.random(in: 0..<tracks.count)
				} while newIndex == currentIndex
				currentIndex = newIndex
			}
		} else {
			currentIndex = (currentIndex + 1) % tracks.count
		}
		prepareCurrentTrack()
		playCurrentTrack()
		updateUI()
	}

	private func goToPreviousTrack() {
		stopTimer()
		if isShuffleEnabled {
			if tracks.count > 1 {
				var newIndex: Int
				repeat {
					newIndex = Int.random(in: 0..<tracks.count)
				} while newIndex == currentIndex
				currentIndex = newIndex
			}
		} else {
			currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
		}
		prepareCurrentTrack()
		playCurrentTrack()
		updateUI()
	}

	// MARK: - Timer / Progress
	private func startTimer() {
		stopTimer()
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
	}

	private func stopTimer() {
		timer?.invalidate(); timer = nil
	}

	@objc private func updateProgress() {
		guard let p = player, p.duration > 0 else { return }

		progressView.progress = Float(p.currentTime / p.duration)
		currentTimeLabel.text = formatTime(p.currentTime)
		durationLabel.text = formatTime(p.duration)
	}
	

	// MARK: - Utils / Animations
	private func animatePlayPauseIcon() {
		let iconName = isPlaying ? "pause.fill" : "play.fill"
		UIView.transition(with: playPauseButton, duration: 0.18, options: .transitionCrossDissolve, animations: {
			self.playPauseButton.setImage(UIImage(systemName: iconName), for: .normal)
		}, completion: nil)
	}

	private func animateTap(_ btn: UIButton) {
		UIView.animate(withDuration: 0.08, animations: {
			btn.alpha = 0.5
		}) { _ in
			UIView.animate(withDuration: 0.08) {
				btn.alpha = 1.0
			}
		}
	}

	private func formatTime(_ sec: TimeInterval) -> String {
		guard sec.isFinite && !sec.isNaN else { return "--:--" }
		let m = Int(sec) / 60
		let s = Int(sec) % 60
		return String(format: "%d:%02d", m, s)
	}
}

// MARK: - AVAudioPlayerDelegate
extension ViewController: AVAudioPlayerDelegate {
	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		// Поведение при окончании трека:
		switch repeatMode {
		case 1: // repeat one
			player.currentTime = 0
			player.play()
		case 2: // repeat all
			goToNextTrack()
		default: // off
			// переход на следующий, если есть (или останавливаемся)
			if currentIndex < tracks.count - 1 {
				goToNextTrack()
			} else {
				// на последнем — остановиться и обновить UI
				isPlaying = false
				animatePlayPauseIcon()
				stopTimer()
			}
		}
	}
}
