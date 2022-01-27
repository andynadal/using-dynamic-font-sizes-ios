//
//  ComplexCell.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class ComplexCell: UITableViewCell {
    static let id = "complexCell"
    
    let estimatedImageHeight: CGFloat = 120.0
    
    lazy var customLabel: UILabel = {
        let label = UILabel()
        label.font = .dynamicFont(named: "Poppins-Regular", relativeSize: 14.0)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .dynamicFont(named: "Poppins-Light", relativeSize: 12.0)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(from url: URL) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            self?.downloadImage(from: url)
        }
    }
    
    private func downloadImage(from url: URL) {
        do {
            let data = try Data(contentsOf: url)
            setImage(from: data)
        } catch {
            print("URL error", error)
        }
    }
    
    private func setImage(from data: Data) {
        UIImage.createThumbnail(from: data, desiredHeight: estimatedImageHeight) { image in
            DispatchQueue.main.async { [weak self] in
                self?.albumImageView.image = image
            }
        }
    }
    
    private func configureConstraints() {
        contentView.addSubview(albumImageView)
        contentView.addSubview(customLabel)
        contentView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            albumImageView.widthAnchor.constraint(equalToConstant: 90.0),
            albumImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            albumImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            albumImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            customLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.1),
            bodyLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: customLabel.lastBaselineAnchor, multiplier: 1.1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: bodyLabel.lastBaselineAnchor, multiplier: 1.1),
            
            customLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 15.0),
            customLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            bodyLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 15.0),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
