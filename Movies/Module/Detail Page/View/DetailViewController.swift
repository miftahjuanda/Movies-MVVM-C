//
//  DetailViewController.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.tag = 1
        button.addTarget(self, action: #selector(eventIsFavorite(sender:)), for: .touchUpInside)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: Constant.textSize20)
        label.textColor = .black
        return label
    }()
    
    private var releaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize14, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private var itemOverviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constant.textSize14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private var itemDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var reviewTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.allowsSelection = false
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .white
        table.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        return table
    }()
    
    
    var typeDetail: TypeDetail?
    var detailCoordinator: DetailCoordinator?
    var viewModel = DetailViewModel(provider: NetworkProvider())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Detail"
        
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        setUIView()
        
        DispatchQueue.main.async {
            self.setDataItem()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        switch typeDetail {
        case .favorite:
            return
        case .TopRated:
            detailCoordinator?.didFinishEventDetailTopRate()
        case .UpComing:
            detailCoordinator?.didFinishEventUpcoming()
        case .nowPlaying:
            detailCoordinator?.didFinishEventNowPlay()
        case .popular:
            detailCoordinator?.didFinishEvent()
        case .none:
            break
        }
    }
    
    private func  setUIView() {
        view.addSubview(itemDetailView)
        itemDetailView.addSubview(itemImage)
        itemImage.backgroundColor = .systemMint
        itemDetailView.addSubview(favoriteButton)
        itemDetailView.addSubview(titleLabel)
        itemDetailView.addSubview(releaseLabel)
        itemDetailView.addSubview(overviewLabel)
        itemDetailView.addSubview(itemOverviewLabel)
        
        view.addSubview(reviewTableView)
        
        NSLayoutConstraint.activate([
            itemDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemDetailView.heightAnchor.constraint(equalToConstant: view.frame.height/2.7),
            
            
            itemImage.topAnchor.constraint(equalTo: itemDetailView.topAnchor, constant: Constant.margin8),
            itemImage.leadingAnchor.constraint(equalTo: itemDetailView.leadingAnchor, constant: Constant.margin8),
            itemImage.bottomAnchor.constraint(equalTo: itemDetailView.bottomAnchor, constant: -Constant.margin8),
            itemImage.widthAnchor.constraint(equalToConstant: view.frame.width/2.5),
            
            favoriteButton.topAnchor.constraint(equalTo: itemDetailView.topAnchor, constant: Constant.margin8*3),
            favoriteButton.trailingAnchor.constraint(equalTo: itemDetailView.trailingAnchor, constant: -Constant.margin8*3),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: itemDetailView.topAnchor, constant: Constant.margin16),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constant.margin8),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -Constant.margin8),
            
            releaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constant.margin8),
            releaseLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constant.margin8),
            releaseLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -Constant.margin8),
            
            overviewLabel.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: Constant.margin16),
            overviewLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constant.margin8),
            overviewLabel.trailingAnchor.constraint(equalTo: itemDetailView.trailingAnchor, constant: -Constant.margin8),
            
            itemOverviewLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: Constant.margin8),
            itemOverviewLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constant.margin8),
            itemOverviewLabel.trailingAnchor.constraint(equalTo: itemDetailView.trailingAnchor, constant: -Constant.margin8),
            itemOverviewLabel.bottomAnchor.constraint(equalTo: itemDetailView.bottomAnchor, constant: -Constant.margin16),
            
            reviewTableView.topAnchor.constraint(equalTo: itemDetailView.bottomAnchor, constant: Constant.margin16),
            reviewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    private func setDataItem() {
        guard let data = viewModel.model else { return }
        let cekId = PersistanceManager.shared.fetchMoviesId(id: data.id ?? 0)
        
        if let image = URL(string: "\(urlImage)\(data.posterPath ?? "")") {
            itemImage.load(url: image)
        }
        
        titleLabel.text = data.title ?? ""
        releaseLabel.text = data.releaseDate ?? ""
        itemOverviewLabel.text = data.overview ?? ""
        
        if cekId {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tag = 2
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tag = 1
        }
    }
    
    
    @objc private func eventIsFavorite(sender: UIButton) {
        guard let data = viewModel.model else { return }
        let cekId = PersistanceManager.shared.fetchMoviesId(id: data.id ?? 0)
        
        if sender.tag == 1 {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            
            if !cekId {
                PersistanceManager.shared.saveToFavorite(id: data.id ?? 0,
                                                         title: data.title ?? "",
                                                         release_date: data.releaseDate ?? "",
                                                         overview: data.overview ?? "",
                                                         poster: (itemImage.image?.pngData())! )
                sender.tag = 2
                favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            
        } else if sender.tag == 2 {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            if cekId {
                let alert = UIAlertController(title: "Hapus Movie?", message: "Apakah anda ingin menghapus \(data.title ?? "") dari favorite?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Tidak", style: .destructive, handler: { _ in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                alert.addAction(UIAlertAction(title: "Hapus", style: .cancel, handler: { _ in
                    sender.tag = 1
                    sender.setImage(UIImage(systemName: "heart"), for: .normal)
                    
                    PersistanceManager.shared.deleteFromFavorite(id: data.id ?? 0, onSuccess: { isSuccess in
                        if isSuccess {
                            alert.dismiss(animated: true, completion: nil)
                        }
                    })
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.viewModel.modelReview
        
        tableView.noDataFound(data?.results?.count ?? 0,
                              title: "Review Not Found",
                              image: "info.circle")
        return data?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        let data = viewModel.modelReview?.results?[indexPath.row]
        
        cell.authorLabel.text = data?.author ?? ""
        cell.contentLabel.text = data?.content ?? ""
        
        return cell
    }
    
}
