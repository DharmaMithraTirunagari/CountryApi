//
//  CountryTableViewCell.swift
//  CountryApi
//
//  Created by Srikanth Kyatham on 12/12/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    static let identifier = "CountryTableViewCell"
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(flagImageView)
        contentView.addSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
                   flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                   flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                   flagImageView.widthAnchor.constraint(equalToConstant: 50),
                   flagImageView.heightAnchor.constraint(equalToConstant: 50)
               ])
               
               // Details Label Constraints
               NSLayoutConstraint.activate([
                   detailsLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 10),
                   detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                   detailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                   detailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
               ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with country: Country) {
        detailsLabel.text = """
        Name: \(country.name)
        Capital: \(country.capital ?? "Not Specified")
        Currency: \(country.currency?.symbol ?? "Not Specified")
        """
        
        flagImageView.image = UIImage(named: "Placeholder")
    }
}

