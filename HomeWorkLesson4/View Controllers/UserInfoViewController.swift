//
//  UserInfoViewController.swift
//  HomeWorkLesson4
//
//  Created by m.kushakov on 12.01.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    //MARK: - Propertyes
    
    var name: String!
    
    //MARK: - Views
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.image = .init(named: "ava")
        image.layer.cornerRadius = 80
        image.layer.masksToBounds = true
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHierarchy()
        setupLayout()
        //userNameLabel.text = userInfoViewController.name
    }
    
    //MARK: - Settings
    
    private func setUpHierarchy() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8580574989, blue: 0.7950903773, alpha: 1)
        view.addSubview(userImage)
        view.addSubview(userNameLabel)
    }
    
    private func setupLayout() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            userImage.heightAnchor.constraint(equalToConstant: 160),
            userImage.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 40),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])
    }
}
