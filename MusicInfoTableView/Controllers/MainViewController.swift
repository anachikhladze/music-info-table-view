//
//  MainViewController.swift
//  MusicInfoTableView
//
//  Created by Anna Sumire on 29.10.23.
//

import UIKit

final class MainViewController: UIViewController, AddNewAlbumDelegate {
    
    // MARK: - Properties
    var tableView = UITableView()
    var musicAlbums: [MusicAlbum] = []
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music Albums"
        musicAlbums = fetchData()
        configureTableView()
        configureAddButton()
    }
    
    // MARK: - Private Methods
    private func configureAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToSecondPage))
        let navigationItem = UINavigationItem(title: "Add Album")
        navigationItem.rightBarButtonItem = addButton
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        navigationBar.setItems([navigationItem], animated: false)
        
        self.tableView.tableHeaderView = navigationBar
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(MusicAlbumCell.self, forCellReuseIdentifier: "MusicAlbum")
        tableView.pin(to: view)
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableVIew DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicAlbum") as! MusicAlbumCell
        let musicAlbum = musicAlbums[indexPath.row]
        cell.set(musicAlbum: musicAlbum)
        
        return cell
    }
    
    @objc private func goToSecondPage() {
        let secondPage = AddNewItemToListViewController()
        secondPage.delegate = self
        navigationController?.pushViewController(secondPage, animated: true)
    }
    
    func addNewAlbum(_ image: UIImage, _ title: String) {
        let newAlbum = MusicAlbum(image: image, title: title)
        musicAlbums.append(newAlbum)
        tableView.reloadData()
    }
}

extension MainViewController {
    
    func fetchData() -> [MusicAlbum] {
        let musicAlbum1 = MusicAlbum(image: Images.blonde, title: "Frank Ocean, Blonde")
        let musicAlbum2 = MusicAlbum(image: Images.dark, title: "Kanye West, My Beautiful Dark Twisted Fantasy")
        let musicAlbum3 = MusicAlbum(image: Images.herLoss, title: "Drake, Her Loss")
        let musicAlbum4 = MusicAlbum(image: Images.world, title: "Brent Fayiaz, F**k The World")
        let musicAlbum5 = MusicAlbum(image: Images.moreLife, title: "Drake, More Life")
        
        return [musicAlbum1, musicAlbum2, musicAlbum3, musicAlbum4, musicAlbum5]
    }
}

// MARK: - TableVIew Delegate
extension MainViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailsViewController = ItemDetailsViewController()
        itemDetailsViewController.image = musicAlbums[indexPath.row].image
        itemDetailsViewController.titleLabel.text = musicAlbums[indexPath.row].title
        navigationController?.pushViewController(itemDetailsViewController, animated: true)
    }
}
