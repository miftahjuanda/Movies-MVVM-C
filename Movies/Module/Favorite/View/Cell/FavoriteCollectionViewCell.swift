//
//  FavoriteCollectionViewCell.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    static let identifier = "FavoriteCollectionViewCell"
    
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
    
    func setData(data: MoviesFavorite?) {
        guard let data = data else { return }
        
        item.itemImage.image = UIImage(data: data.poster_image!)
        item.titleLabel.text = data.title
        item.releaseLabel.text = data.release_date
        item.descLabel.text = data.overview
    }
    
}
