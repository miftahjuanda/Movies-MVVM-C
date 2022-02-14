//
//  TopRateViewController.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class TopRateViewController: UIViewController {
    
    private lazy var topRateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInsetReference = .fromContentInset
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height/4)
        layout.minimumLineSpacing = 8
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInsetAdjustmentBehavior = .always
        cv.backgroundColor = .clear
        cv.register(TopRateCollectionViewCell.self, forCellWithReuseIdentifier: TopRateCollectionViewCell.identifier)
        
        return cv
    }()
    
    var topRateCoordinator: TopRateCoordinator?
    var topRateViewModel: TopRatedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color-bg")
        
        topRateCollectionView.delegate = self
        topRateCollectionView.dataSource = self
        
        setUIView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        topRateCoordinator?.didFinishEvent()
    }
    
    private func setUIView() {
        view.addSubview(topRateCollectionView)
        
        NSLayoutConstraint.activate([
            topRateCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topRateCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topRateCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topRateCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}


extension TopRateViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRateViewModel?.model?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRateCollectionViewCell.identifier, for: indexPath) as! TopRateCollectionViewCell
        cell.setData(data: topRateViewModel?.model?.results?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        topRateCoordinator?.startToDetail(id: topRateViewModel?.model?.results?[indexPath.row].id ?? 0)
    }
    
}
