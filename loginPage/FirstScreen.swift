//
//  FirstScreen.swift
//  loginPage
//
//  Created by Sabir's MacBook on 4/10/23.
//

import UIKit

class FirstScreen: UIViewController {
    
    let imageView = UIImageView(image: UIImage(named: "esewa")) // add an image view
    let usernameTextField = UITextField() // username text field
    let passwordTextField = UITextField() // password text field
    let submitButton = UIButton(type: .system) // add a submit button

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        // Add the image view
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Add the username text field
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add the password text field
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add the submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemCyan
        submitButton.layer.cornerRadius = 10
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add a tap gesture recognizer to dismiss the keyboard
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func submitButtonTapped() {
        // Check if the username and password fields are filled
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // If the fields are not filled, animate the submit button with a "buzz" effect
            UIView.animate(withDuration: 0.1, animations: {
                self.submitButton.transform = CGAffineTransform(translationX: 10, y: 0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.submitButton.transform = CGAffineTransform(translationX: -10, y: 0)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.submitButton.transform = CGAffineTransform(translationX: 10, y: 0)
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.1, animations: {
                            self.submitButton.transform = CGAffineTransform.identity
                        })
                    })
                })
            })
            return
        }
        
        // Handle submit button tapped event when the fields are filled
    }
}


