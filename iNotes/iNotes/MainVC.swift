//
//  MainVC.swift
//  iNotes
//
//  Created by Nick patel on 22/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    private let myLabel1:UILabel = {
       let label = UILabel()
        label.text = "Capture Ideas"
        label.textColor = .black
        label.font = UIFont(name: "arial", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
     
    
    private let mylabel2:UILabel = {
       let label = UILabel()
        label.text = "Type, handwrite, annotate, draw, hightlight, scan & record noes and documents."
        label.numberOfLines = 3
        label.font = UIFont(name: "arial", size: 17)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let btnnext:UIButton = {
         let btn = UIButton()
         btn.setTitle("Let's Go", for: .normal)
         btn.backgroundColor = .systemPurple
         btn.layer.cornerRadius = 20
         btn.addTarget(self, action: #selector(btnnexthandle), for: .touchUpInside)
         return btn
     }()
    
    
     private let BGimage:UIImageView = {
            let img  = UIImageView(image: UIImage(named: "mainBG"))
            return img
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         
               view.addSubview(BGimage)
               view.addSubview(myLabel1)
               view.addSubview(mylabel2)
               view.addSubview(btnnext)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        BGimage.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
      
        myLabel1.frame = CGRect(x: 80, y: 382, width: 217, height: 45)
        mylabel2.frame = CGRect(x: 40, y: 439, width: 300, height: 66)
        btnnext.frame = CGRect(x: 130, y: 550, width: 122, height: 40)
    }
     
    @objc func btnnexthandle()
    {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
