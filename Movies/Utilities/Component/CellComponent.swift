//
//  CellComponent.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class CellComponent: UIView {
    
    var itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    private var stackViewVertical: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .top
        stack.distribution = .fill
        return stack
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: Constant.textSize20)
        label.textColor = .black
        return label
    }()
    
    var releaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize14, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(itemImage)
        itemImage.backgroundColor = .systemCyan
        addSubview(stackViewVertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackViewVertical.addArrangedSubview(titleLabel)
        stackViewVertical.addArrangedSubview(releaseLabel)
        stackViewVertical.addArrangedSubview(descLabel)
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.margin8),
            itemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.margin8),
            itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constant.margin8),
            itemImage.widthAnchor.constraint(equalToConstant: self.frame.width/2.7),
            
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.margin16),
            stackViewVertical.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constant.margin8),
            stackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constant.margin8),
            stackViewVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constant.margin16),
        ])
        
    }
    
}
