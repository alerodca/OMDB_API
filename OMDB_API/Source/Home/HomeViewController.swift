//
//  HomeViewController.swift
//  OMDB_API
//
//  Created by Alejandro Rodríguez Cañete on 20/9/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOUtlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    let apicall = APICall()
    var contentSearchBar: String = ""
    var lengthContentSearchBar: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Actions
    
    func configureUI() {
        // titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.text = "Entertainment Search"
        // searchBar
        searchBar.placeholder = "Enter the name for search..."
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        // tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        contentSearchBar = searchBar.text ?? ""
        print(contentSearchBar)
        lengthContentSearchBar = contentSearchBar.count
        
        if (lengthContentSearchBar > 3) {
            apicall.getMoviesOrSeries(search: contentSearchBar)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apicall.enternaiment.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        cell.textLabel?.text = indexPath.row.description
        
        return cell
    }


}
