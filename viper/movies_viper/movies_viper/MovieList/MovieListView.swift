//
//  MovieListView.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import UIKit

class MovieListView: UIViewController {

    private var moviesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 120
        table.rowHeight = UITableView.automaticDimension
        table.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return table
    }()

    private let  presenter: MovieListPresentable

    init(presenter: MovieListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        setupTableVieW()
        presenter.fecthMovies()
    }

    private func setupTableVieW() {
        view.addSubview(moviesTableView)

        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])

        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
}

// MARK: - Delegate
extension MovieListView: MovieListUI {
    func update(movies: [MovieCellViewModel]) {
        print(movies)
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension MovieListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieModel = presenter.viewModels[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        cell.configure(model: movieModel)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        presenter.onTapCell(index: indexPath.row)
    }
}
