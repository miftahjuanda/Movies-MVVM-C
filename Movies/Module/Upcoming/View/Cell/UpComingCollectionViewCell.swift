//
//  UpComingCollectionViewCell.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    static let identifier = "UpComingCollectionViewCell"
    
    var item = CellComponent()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 2
        contentView.backgroundColor = .white
        contentView.addSubview(item)
        
        setUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUICell() {
        contentView.addSubview(item)
        
        NSLayoutConstraint.activate([
            item.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.margin8),
            item.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.margin8),
            item.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.margin8),
            item.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.margin8),
        ])
        
    }
    
    func setData(data: ResultUpComing?) {
        guard let data = data else { return }
        
        if let image = URL(string: "\(urlImage)\(data.posterPath ?? "")") {
            item.itemImage.load(url: image)
        }
        item.titleLabel.text = data.title
        item.releaseLabel.text = data.releaseDate
        item.descLabel.text = data.overview
    }
    
}
