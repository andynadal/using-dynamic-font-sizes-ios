//
//  SimpleCell.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class SimpleCell: UITableViewCell {
    static let id = "simpleCell"
    
    lazy var customLabel: UILabel = {
        let label = UILabel()
        label.font = .dynamicFont(named: "Poppins-Regular", relativeSize: 14.0)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureConstraints() {
        contentView.addSubview(customLabel)
        
        NSLayoutConstraint.activate([
            customLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: customLabel.lastBaselineAnchor, multiplier: 1.1),
            
            customLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            customLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
