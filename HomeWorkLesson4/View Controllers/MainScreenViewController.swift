//
//  ViewController.swift
//  HomeWorkLesson4
//
//  Created by m.kushakov on 11.01.2022.
//

import UIKit

class MainScreenViewController: UIViewController {

    //MARK: - Views
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Введите логин и пароль для входа в аккаунт"
        
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15)
        textField.placeholder = "Логин"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15)
        textField.placeholder = "Пароль"
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.backgroundColor = .darkGray
        view.addSubview(topLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }

    private func setupLayout() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: - Actions
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let userInfoViewController = UserInfoViewController()
        userInfoViewController.tabBarItem = UITabBarItem(title: "Инфо", image: .init(systemName: "person.crop.circle"), tag: 0)
        let userDataViewController = UserDataViewController()
        userDataViewController.tabBarItem = UITabBarItem(title: "Данные", image: .init(systemName: "folder.circle"), tag: 1)

        tabBarController.setViewControllers([
            userInfoViewController,
            userDataViewController
        ], animated: true)
        
        tabBarController.tabBar.barStyle = .default
        tabBarController.tabBar.tintColor = .darkGray
        
        return tabBarController
    }
    
    @objc private func loginButtonTapped() {
        let userInfoViewController = UserInfoViewController()
        userInfoViewController.name = loginTextField.text ?? "Пользователь1"
        
        let tabBarController = createTabBarController()
        present(tabBarController, animated: true, completion: nil)
    }
}

