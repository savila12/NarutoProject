//
//  AnimeDetailsViewController.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchTxtField = UITextField()
    let searchBtn = UIButton()
    let imgView = UIImageView()
    
    var passSearchText: ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSearchTxtField()
        setUpSearchBtn()
        setUpImage()
        //hideKeyboardWhenTappedAround()
    }
    

    func setUpSearchTxtField(){
        view.addSubview(searchTxtField)
        searchTxtField.translatesAutoresizingMaskIntoConstraints = false
        searchTxtField.layer.borderWidth = 1
        searchTxtField.layer.borderColor = UIColor.black.cgColor
        searchTxtField.layer.cornerRadius = 10
        searchTxtField.backgroundColor = UIColor.white
        
        searchTxtField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        searchTxtField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        searchTxtField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        searchTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setUpSearchBtn() {
        view.addSubview(searchBtn)
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.setTitleColor(.black, for: .normal)
        searchBtn.backgroundColor = UIColor.orange
        searchBtn.layer.borderWidth = 1
        searchBtn.layer.borderColor = UIColor.black.cgColor
        searchBtn.layer.cornerRadius = 10
        
        searchBtn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        
        searchBtn.topAnchor.constraint(equalTo: searchTxtField.bottomAnchor, constant: 10).isActive = true
        searchBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        searchBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
    }
    
    func setUpImage() {
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "naruto")
        imgView.contentMode = .scaleAspectFit
        imgView.topAnchor.constraint(equalTo: searchBtn.bottomAnchor, constant: 50).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        imgView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        
        
    }
    
    @objc func btnPressed() {
        //Check if text contains more 3 or more characters
        if let text = searchTxtField.text, text.count >= 3 {
            passSearchText?(text.lowercased())
            print("Button Pressed")
            self.dismiss(animated: true) {
                //self.reloadInputViews()
                self.parent?.reloadInputViews()
                
            }
        }
    }
}





