//
//  ViewController.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

final class ViewController: UIViewController {

    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to simple table view", for: .normal)
        button.titleLabel?.font = .dynamicFont(named: "Poppins-Regular", relativeSize: 14.0)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSimpleTableView), for: .touchUpInside)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to medium-sized table view", for: .normal)
        button.titleLabel?.font = .dynamicFont(named: "Poppins-SemiBold", relativeSize: 14.0)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToDoubleTableView), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to complex table view", for: .normal)
        button.titleLabel?.font = .dynamicFont(named: "Poppins-Bold", relativeSize: 14.0)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToComplexTableView), for: .touchUpInside)
        return button
    }()
    
    @objc
    func goToSimpleTableView() {
        let simpleTableView = SimpleTableViewController()
        navigationController?.pushViewController(simpleTableView, animated: true)
    }
    
    @objc
    func goToDoubleTableView() {
        let doubleTableView = DoubleTableViewController()
        navigationController?.pushViewController(doubleTableView, animated: true)
    }
    
    @objc
    func goToComplexTableView() {
        let complexTableView = ComplexTableViewController()
        navigationController?.pushViewController(complexTableView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Dynamic Font Heights"
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            firstButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            firstButton.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 1.3),
            
            secondButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            secondButton.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: firstButton.lastBaselineAnchor, multiplier: 1.3),
            
            thirdButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            thirdButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            thirdButton.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: secondButton.lastBaselineAnchor, multiplier: 1.3),
        ])
    }
}

