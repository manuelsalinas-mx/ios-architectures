//
//  HomeView.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    

    // MARK: Properties
    var presenter: HomePresenterProtocol?
    private var categories: [String] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Homē"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter?.viewDidLoad()
    }
}

// MARK: - HomeViewProtocol
extension HomeView: HomeViewProtocol {
    func showLoading() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }

    func stopLoading() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
        }
    }

    // TODO: implement view output methods
    func categoriesFromPresenter(_ categories: [String]) {
        self.categories = categories

        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = categories[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 14, weight: .medium, width: .condensed)
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.presentDetail(with: categories[indexPath.row])
    }
}
