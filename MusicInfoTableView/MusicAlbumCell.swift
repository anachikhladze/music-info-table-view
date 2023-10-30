//
//  MusicAlbumCell.swift
//  MusicInfoTableView
//
//  Created by Anna Sumire on 29.10.23.
//

import UIKit

class MusicAlbumCell: UITableViewCell {
    
    var musicAlbumImageView = UIImageView()
    var musicAlbumTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubview(musicAlbumImageView)
        addSubview(musicAlbumTitleLabel)
        
        configureMusicAlbumImageView()
        configureMusicAlbumTitleLabel()
        setAlbumImageConstraints()
        setAlbumTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(musicAlbum: MusicAlbum) {
        musicAlbumImageView.image = musicAlbum.image
        musicAlbumTitleLabel.text = musicAlbum.title
    }
    
    private func configureMusicAlbumImageView() {
        musicAlbumImageView.layer.cornerRadius = 10
        musicAlbumImageView.clipsToBounds = true
    }
    
    private func configureMusicAlbumTitleLabel() {
        musicAlbumTitleLabel.numberOfLines = 0
        musicAlbumTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setAlbumImageConstraints() {
        musicAlbumImageView.translatesAutoresizingMaskIntoConstraints = false
        musicAlbumImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        musicAlbumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        musicAlbumImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        musicAlbumImageView.widthAnchor.constraint(equalTo: musicAlbumImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func setAlbumTitleConstraints() {
        musicAlbumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        musicAlbumTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        musicAlbumTitleLabel.leadingAnchor.constraint(equalTo: musicAlbumImageView.trailingAnchor, constant: 20).isActive = true
        musicAlbumTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        musicAlbumTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
