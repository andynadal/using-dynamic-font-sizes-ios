//
//  DoubleTableViewController.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class DoubleTableViewController: UITableViewController {
    var comments = [Comment]()
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DoubleCell.self, forCellReuseIdentifier: DoubleCell.id)
        
        navigationItem.title = "Double Table View"
        
        ServiceManager.fetchComments { [weak self] comments in
            DispatchQueue.main.async {
                self?.comments = comments
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DoubleCell.id, for: indexPath) as? DoubleCell else {
            return UITableViewCell()
        }
        cell.customLabel.text = comments[indexPath.row].name
        cell.bodyLabel.text = comments[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
}
