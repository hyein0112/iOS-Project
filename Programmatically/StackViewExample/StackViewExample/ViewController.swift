//
//  ViewController.swift
//  StackViewExample
//
//  Created by GSM02 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createStackView()
    }

    func createStackView() {
        
        let imgView = UIImageView()
        imgView.backgroundColor = .systemGreen
        imgView.image = UIImage(systemName: "bell")
        imgView.contentMode = .scaleAspectFit
//        imgView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2).isActive = true
//        imgView.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
        
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.text = "Hello world"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21, weight: .bold)
//        label.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let label2 = UILabel()
        label.backgroundColor = .systemOrange
        label.text = "Another Label"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21, weight: .bold)
        
        let stackView = UIStackView(arrangedSubviews: [imgView, label, label2])
        stackView.frame = view.bounds
        stackView.backgroundColor = .systemYellow
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        
        view.addSubview(stackView)
        
    }

}

