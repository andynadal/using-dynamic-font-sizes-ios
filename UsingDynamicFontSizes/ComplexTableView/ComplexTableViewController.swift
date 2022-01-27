//
//  ComplexTableViewController.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class ComplexTableViewController: UITableViewController {
    var photos = [Photo]()
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ComplexCell.self, forCellReuseIdentifier: ComplexCell.id)
        
        navigationItem.title = "Complex Table View"
        
        ServiceManager.fetchPhotos { [weak self] photos in
            DispatchQueue.main.async {
                self?.photos = photos
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComplexCell.id, for: indexPath) as? ComplexCell else {
            return UITableViewCell()
        }
        cell.customLabel.text = photos[indexPath.row].title
        cell.bodyLabel.text = "A simple description"
        if let url = URL(string: "https://media.istockphoto.com/photos/image-of-beatiful-landscape-taiwan-picture-id530045145?k=6&m=530045145&s=170667a&w=0&h=hIglXB9isrW4lTuIVxA3tUU4qzOsuJRq7hsUt3taGpI=") {
            cell.setImage(from: url)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
}
