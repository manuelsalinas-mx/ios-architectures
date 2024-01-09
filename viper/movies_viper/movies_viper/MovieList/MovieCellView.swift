//
//  MovieCellView.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import UIKit
import Kingfisher

class MovieCellView: UITableViewCell {
    let poster: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()

    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let info: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .bold, width: .condensed)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(poster)
        addSubview(title)
        addSubview(info)

        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            poster.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            poster.heightAnchor.constraint(equalToConstant: 200),
            poster.widthAnchor.constraint(equalToConstant: 100),
            poster.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant:  -12),

            title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant:  18),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -12),
            title.topAnchor.constraint(equalTo: poster.topAnchor, constant: 24),

            info.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant:  20),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -12),
            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            info.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant:  -12)
        ])
    }

    func configure(model: MovieCellViewModel) {
        poster.kf.setImage(with: model.imageUrl!)
        title.text = model.title
        info.text = model.overview
    }
}
