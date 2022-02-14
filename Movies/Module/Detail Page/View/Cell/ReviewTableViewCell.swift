//
//  ReviewTableViewCell.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: Constant.textSize14)
        label.textColor = .black
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize12, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUICell() {
        contentView.backgroundColor = .white
        contentView.addSubview(authorLabel)
        contentView.addSubview(contentLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 5),
            authorLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -5),
            
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 5),
            contentLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -5),
            contentLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -5),
        ])
    }
}
