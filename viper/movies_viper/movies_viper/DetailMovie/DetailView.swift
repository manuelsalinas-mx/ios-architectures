//
//  DetailView.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import UIKit
import Kingfisher

class DetailView: UIViewController {
    private let presenter: DetailPresentable

    let poster: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()

    let movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let moviewDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25, weight: .regular, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
        presenter.getMovieDetail()
    }

    private func setupView() {
        view.addSubview(poster)
        view.addSubview(movieTitle)
        view.addSubview(moviewDescription)

        NSLayoutConstraint.activate([
            poster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poster.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            poster.heightAnchor.constraint(equalToConstant: 200),
            poster.widthAnchor.constraint(equalToConstant: 300),

            movieTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieTitle.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 20),

            moviewDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moviewDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            moviewDescription.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),

        ])
    }
}

// MARK: - Delegate
extension DetailView: DetailPresenterUI {
    func updateUI(viewModel: DetailMovieViewModel) {
        poster.kf.setImage(with: viewModel.backdropPath)
        movieTitle.text = viewModel.title
        moviewDescription.text = viewModel.overview
    }
}
