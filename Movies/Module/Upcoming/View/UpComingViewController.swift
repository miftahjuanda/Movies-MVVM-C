//
//  UpComingViewController.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private lazy var upComingCollectionView: UICollectionView = {
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
        cv.register(UpComingCollectionViewCell.self, forCellWithReuseIdentifier: UpComingCollectionViewCell.identifier)
        
        return cv
    }()
    
    var upcomingCoordinator: UpComingCoordinator?
    var upcomingViewModel: UpComingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color-bg")
        
        upComingCollectionView.delegate = self
        upComingCollectionView.dataSource = self
        
        setUIView()
    }
    
    private func setUIView() {
        view.addSubview(upComingCollectionView)
        
        NSLayoutConstraint.activate([
            upComingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            upComingCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            upComingCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            upComingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension UpComingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingViewModel?.model?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.identifier, for: indexPath) as! UpComingCollectionViewCell
        cell.setData(data: upcomingViewModel?.model?.results?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        upcomingCoordinator?.startToDetail(id: upcomingViewModel?.model?.results?[indexPath.row].id ?? 0)
    }
    
}
