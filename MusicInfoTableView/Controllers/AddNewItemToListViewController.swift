//
//  AddNewItemToListViewController.swift
//  MusicInfoTableView
//
//  Created by Anna Sumire on 29.10.23.
//

import UIKit

protocol AddNewAlbumDelegate: AnyObject {
    func addNewAlbum(_ image: UIImage, _ title: String)
}

final class AddNewItemToListViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddNewAlbumDelegate?
    
    let imageView = UIImageView()
    let uploadImageButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let textField = UITextField()
    let saveButton = UIButton()
    let stackView = UIStackView()
    var selectedImage: UIImage?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        setupUploadImageButton()
        setupTitleLabel()
        setupTextField()
        setupSaveButton()
        setupStackView()
        setupSubviews()
        setupBackground()
    }
    
    // MARK: - Private Methods
    private func setupImageView() {
        imageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        imageView.image = UIImage(named: "imageName")
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupUploadImageButton() {
        uploadImageButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        uploadImageButton.configuration = .filled()
        uploadImageButton.setTitle("Upload Image", for: .normal)
        uploadImageButton.addTarget(self, action: #selector(uploadImageButtonPressed), for: .touchUpInside)
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "Upload Your Favorite Album Cover"
    }
    
    private func setupTextField() {
        textField.placeholder = "Type Album Name"
        textField.layer.cornerRadius = 30
    }
    
    private func setupSaveButton() {
        saveButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        saveButton.configuration = .filled()
        saveButton.setTitle("Save Image", for: .normal)
        saveButton.addTarget(self, action: #selector(saveImageButtonPressed), for: .touchUpInside)
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalCentering
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            stackView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(uploadImageButton)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(saveButton)
        
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    @objc private func saveImageButtonPressed() {
        let albumTitle = textField.text ?? " "
        if let selectedImage = self.selectedImage {
            delegate?.addNewAlbum(selectedImage, albumTitle)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func uploadImageButtonPressed(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func selectImage(_ image: UIImage, _ title: String) {
        delegate?.addNewAlbum(image, title)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UIImagePickerController
extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
            selectedImage = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
