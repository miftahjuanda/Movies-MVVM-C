//
//  NowPlayingViewController.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    private lazy var nowPlayingCollectionView: UICollectionView = {
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
        cv.register(NowPlayingCollectionViewCell.self, forCellWithReuseIdentifier: NowPlayingCollectionViewCell.identifier)
        
        return cv
    }()
    
    var nowPlayingCoordinator: NowPlayingCoordinator?
    var nowPlayingViewModel: NowPlayingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color-bg")
        
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
        
        setUIView()
    }
    
    private func setUIView() {
        view.addSubview(nowPlayingCollectionView)
        
        NSLayoutConstraint.activate([
            nowPlayingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nowPlayingCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            nowPlayingCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nowPlayingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}


extension NowPlayingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingViewModel?.model?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as! NowPlayingCollectionViewCell
        cell.setData(data: nowPlayingViewModel?.model?.results?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nowPlayingCoordinator?.startToDetail(id: nowPlayingViewModel?.model?.results?[indexPath.row].id ?? 0)
    }
    
    
}
