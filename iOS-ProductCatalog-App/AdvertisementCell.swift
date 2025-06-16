//
//  AdvertisementCell.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import UIKit

class AdvertisementCell: UICollectionViewCell {
    static let reuseID = String(describing: AdvertisementCell.self)
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        return label
    }()
    
    private let createdDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        addSubViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has  not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.frame.size.width - 10,
                                 height: contentView.frame.size.width - 10)
        spinner.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width - 10,
                               height: contentView.frame.size.width - 10)
        titleLabel.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height / 100 * 65,
                                  width: contentView.frame.size.width - 10,
                                  height: contentView.frame.size.height / 100 * 16)
        priceLabel.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height / 100 * 82.5,
                                  width: contentView.frame.size.width - 10,
                                  height: contentView.frame.size.height / 100 * 8)
        locationLabel.frame = CGRect(x: 5,
                                     y: contentView.frame.size.height / 100 * 92,
                                     width: contentView.frame.size.width - 10,
                                     height: contentView.frame.size.height / 100 * 4)
        createdDateLabel.frame = CGRect(x: 5,
                                        y: contentView.frame.size.height / 100 * 96,
                                        width: contentView.frame.size.width - 10,
                                        height: contentView.frame.size.height / 100 * 4)
    }
    
    func addSubViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(spinner)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(createdDateLabel)
    }
    
    func configure(imageData: Data, title: String, price: String, location: String, date: String) {
        imageView.image = UIImage(data: imageData)
        titleLabel.text  =  title
        priceLabel.text = price
        locationLabel.text = location
        createdDateLabel.text = date
    }
}
