//
//  MovieViewController.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 09/02/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    private lazy var movieCollectionView: UICollectionView = {
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
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        return cv
    }()
    
    private var categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Category", for: .normal)
        button.backgroundColor = UIColor(named: "Color-1")
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(eventCategory), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoriteButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.style = .plain
        btn.image = UIImage(systemName: "heart.fill")
        btn.target = self
        btn.tintColor = .red
        btn.action = #selector(eventFavorite)
        return btn
    }()
    
    var movieCoordinator: CoordinatorMovie?
    var viewModel = MovieViewModel(provider: NetworkProvider())
    
    private var currentPage: Int = 1
    private var totalPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color-bg")
        title = "Movies"
        
        self.navigationItem.rightBarButtonItem = favoriteButton
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        setUIVIew()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setUIVIew() {
        view.addSubview(movieCollectionView)
        view.addSubview(categoryButton)
        
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: categoryButton.safeAreaLayoutGuide.topAnchor),
            
            categoryButton.heightAnchor.constraint(equalToConstant: 40),
            categoryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    @objc func eventFavorite() {
        self.movieCoordinator?.startToFavorite()
    }
    
    @objc private func eventCategory() {
        let alert = UIAlertController(title: "Pilih Category", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { _ in
            self.movieCoordinator?.startToNowPlaying()
        }))
        
        alert.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { _ in
            self.movieCoordinator?.startToUpComing()
        }))
        
        alert.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { _ in
            self.movieCoordinator?.startToTopRated()
        }))
        
        alert.addAction(UIAlertAction(title: "Popular", style: .cancel, handler: { _ in
            
        }))
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        
        cell.setData(data: viewModel.model?.results?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        movieCoordinator?.startToDetail(id: viewModel.model?.results?[indexPath.row].id ?? 0)
    }
    
}
