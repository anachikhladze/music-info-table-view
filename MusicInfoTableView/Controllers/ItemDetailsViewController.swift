//
//  ItemDetailsViewController.swift
//  MusicInfoTableView
//
//  Created by Anna Sumire on 30.10.23.
//

import UIKit

final class ItemDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var image = UIImage()
    var titleLabel = UILabel()
    private var imageView = UIImageView()
    private var stackView = UIStackView()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupBackground()
        setupConstraints()
        setupStackView()
        setupImageView()
        setupTitleLabel()
    }
    
    // MARK: - Private Methods
    private func setupStackView() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .systemGroupedBackground
        stackView.layer.cornerRadius = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    private func setupImageView() {
        imageView.image = image
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            imageView.widthAnchor.constraint(equalToConstant: 170),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
