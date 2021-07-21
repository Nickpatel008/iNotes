//
//  ViewController.swift
//  iNotes
//
//  Created by Nick patel on 20/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let myLabel:UILabel = {
       let label = UILabel()
        label.text = "Welcome to iNotes"
        label.textColor = .black
        label.font = UIFont(name: "arial", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let mylabel1:UILabel = {
       let label = UILabel()
        label.text = "hey,"
        label.font = UIFont(name: "arial", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    private let mylabel2:UILabel = {
       let label = UILabel()
        label.text = "Log in here"
        label.font = UIFont(name: "arial", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    private let usernamelbl:UILabel = {
       let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        return label
    }()
    
    private let emailtxt:UITextField = {
       let email = UITextField()
        email.placeholder = "Enter Your Email"
        email.textAlignment = .center
        email.textColor = .black
        email.backgroundColor = .gray
        email.text = "dvl"
        email.layer.cornerRadius = 10
        email.alpha = 0.5
        return email
    } ()
    
    private let passowrdlbl:UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        return label
    }()
    
    private let passwordtxt:UITextField = {
          let password = UITextField()
           password.placeholder = "Enter Your Password"
            //password.isSecureTextEntry = true
           password.textAlignment = .center
        password.backgroundColor = .gray
        password.layer.cornerRadius = 10
           password.textColor = .black
        password.alpha = 0.5
        password.text = "dvl"
        password.isSecureTextEntry = true
           return password
    } ()
    
    private let loginbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Log in", for: .normal)
        btn.backgroundColor = .brown
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(btnlogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
     private let BGimage:UIImageView = {
         let img  = UIImageView(image: UIImage(named: "loginBG"))
         return img
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = .white
        
        view.addSubview(BGimage)
        view.addSubview(myLabel)
        view.addSubview(mylabel1)
        view.addSubview(mylabel2)
        view.addSubview(usernamelbl)
        view.addSubview(emailtxt)
        view.addSubview(passowrdlbl)
        view.addSubview(passwordtxt)
        view.addSubview(loginbtn)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        BGimage.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        myLabel.frame = CGRect(x: 50, y: 40, width: 300, height: 100)
        mylabel1.frame = CGRect(x: 40, y: 164, width: 121, height: 66)
        mylabel2.frame = CGRect(x: 40, y: 198, width: 150, height: 66)
        usernamelbl.frame = CGRect(x: 40, y: 353, width: 42, height: 25)
        emailtxt.frame = CGRect(x: 40, y: 386, width: 278, height: 40)
        passowrdlbl.frame = CGRect(x: 40, y: 442, width: 100, height: 25)
        passwordtxt.frame = CGRect(x: 40, y: 475, width: 278, height: 40)
        loginbtn.frame = CGRect(x: 130, y: 550, width: 122, height: 40)
    }

    @objc func btnlogin()
    {
        let vc = NotesVC()
        
        if emailtxt.text == "dvl" && passwordtxt.text == "dvl" {
            UserDefaults.standard.setValue("dvl1", forKey: "TokenValue")
            UserDefaults.standard.setValue("\(emailtxt.text ?? "")", forKey: "email")
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Use Dvl as username and password", preferredStyle: . alert)
            alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: {[weak self] _ in
                        
            }))
                                                     
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
        
    }
    
}

