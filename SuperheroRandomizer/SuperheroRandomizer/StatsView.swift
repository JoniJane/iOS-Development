//
//  StatsView.swift
//  SuperheroRandomizer
//
//  Created by Zhanel Amanzhol on 29.11.2025.
//

import UIKit

/// Одна строка статов: [Title]  [====progress====]  [value]
final class StatsView: UIView {
	
	private let titleLabel = UILabel()
	private let valueLabel = UILabel()
	private let progressView = UIProgressView(progressViewStyle: .default)
	private let hStack = UIStackView()
	
	// MARK: - Init
	
	init(title: String, value: Int) {
		super.init(frame: .zero)
		setupUI(title: title, value: value)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI(title: "", value: 0)
	}
	
	// MARK: - UI
	
	private func setupUI(title: String, value: Int) {
		// Настройка лейблов
		titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		titleLabel.textColor = .label
		titleLabel.text = title
		titleLabel.textAlignment = .left
		
		valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		valueLabel.textColor = .label
		valueLabel.textAlignment = .right
		valueLabel.text = "\(value)"
		
		// Настройка прогресс-бара
		let clamped = max(0, min(100, value))
		progressView.progress = Float(clamped) / 100.0
		progressView.progressTintColor = .systemPurple
		progressView.trackTintColor = .systemGray5
		progressView.layer.cornerRadius = 4
		progressView.clipsToBounds = true
		
		// Стек по горизонтали
		hStack.axis = .horizontal
		hStack.alignment = .center
		hStack.distribution = .fill
		hStack.spacing = 8
		
		hStack.addArrangedSubview(titleLabel)
		hStack.addArrangedSubview(progressView)
		hStack.addArrangedSubview(valueLabel)
		// valueLabel как и было
		valueLabel.setContentHuggingPriority(.required, for: .horizontal)
		valueLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
		
	
		addSubview(hStack)
		hStack.translatesAutoresizingMaskIntoConstraints = false
		progressView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			hStack.topAnchor.constraint(equalTo: topAnchor),
			hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
			hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			hStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			progressView.heightAnchor.constraint(equalToConstant: 4),
			titleLabel.widthAnchor.constraint(equalToConstant: 120),
			valueLabel.widthAnchor.constraint(equalToConstant: 32)
		])
	}
}
