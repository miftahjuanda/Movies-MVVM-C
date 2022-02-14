//
//  Utilities.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 11/02/22.
//

import UIKit

var ApiKey = ""

let urlImage = "https://image.tmdb.org/t/p/w500"


class Constant {
    static let margin16: CGFloat = 16
    static let margin8: CGFloat = 8
    
    static let textSize12: CGFloat = 12
    static let textSize14: CGFloat = 14
    static let textSize20: CGFloat = 20
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UITableView {
    func noDataFound(_ dataCount:Int, title: String, image: String){
        if dataCount <=  0 {
            let label = UILabel()
            let attributedString = NSMutableAttributedString()
            let stringImage = NSTextAttachment()
            stringImage.image = UIImage(systemName: image)
            
            label.frame = self.frame
            label.frame.origin.x = 0
            label.frame.origin.y = 0
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = .black
            
            attributedString.append(NSAttributedString(attachment: stringImage))
            attributedString.append(NSAttributedString(string: "\n\n\(title)"))
            label.attributedText = attributedString
            self.backgroundView = label
        }else{
            self.backgroundView = nil
        }
    }
}

extension UICollectionView {
    func noDataFound(_ dataCount:Int, title: String, image: String){
        if dataCount <=  0 {
            let label = UILabel()
            let attributedString = NSMutableAttributedString()
            let stringImage = NSTextAttachment()
            stringImage.image = UIImage(systemName: image)
            
            label.frame = self.frame
            label.frame.origin.x = 0
            label.frame.origin.y = 0
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = .black
            
            attributedString.append(NSAttributedString(attachment: stringImage))
            attributedString.append(NSAttributedString(string: "\n\n\(title)"))
            label.attributedText = attributedString
            self.backgroundView = label
        }else{
            self.backgroundView = nil
        }
    }
}

enum TypeDetail {
    case favorite
    case nowPlaying
    case UpComing
    case TopRated
    case popular
    
}
