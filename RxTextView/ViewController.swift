//
//  ViewController.swift
//  RxTextView
//
//  Created by Mac on 12.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    private let txtView = customTextView()
    private let saveButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width - 20, height: 40)
        self.saveButton.setTitle("save", for: .normal)
        self.saveButton.backgroundColor = .systemBlue
        self.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        self.view.addSubview(self.saveButton)
        
        
        self.txtView.frame = CGRect(x: 10 , y: 60, width: self.view.frame.size.width - 20, height: self.view.frame.size.height - 60)
        self.txtView.setupView(settingView: true)
        self.view.addSubview(self.txtView)
    }
    @objc func saveButtonTapped(){
     
    }
        
        //UserDefaults.standard.set(self.txtView.attributedText, forKey: "attributes")
//        UserDefaults.standard.set(self.txtView.text, forKey: "textviewKey")
//        UserDefaults.standard.synchronize()
    }

