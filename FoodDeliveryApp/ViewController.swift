//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Анастасия on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "Hello, world!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black 
        
    }
    
    


}

