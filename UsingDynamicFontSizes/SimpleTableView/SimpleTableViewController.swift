//
//  SimpleTableViewController.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class SimpleTableViewController: UITableViewController {
    var comments = [Comment]()
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 30.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(SimpleCell.self, forCellReuseIdentifier: SimpleCell.id)
        
        navigationItem.title = "Simple Table View"
        
        ServiceManager.fetchComments { [weak self] comments in
            DispatchQueue.main.async {
                self?.comments = comments
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SimpleCell.id, for: indexPath) as? SimpleCell else {
            return UITableViewCell()
        }
        cell.customLabel.text = comments[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
}
