//
//  OpenFileVC.swift
//  iNotes
//
//  Created by Nick patel on 21/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class NewFileVC: UIViewController {

    var updatefile = ""
    
    
    private let newnotelbl:UILabel = {
       let label = UILabel()
        label.text = "New Note"
        label.textColor = .black
        //label.font = UIFont(name: "arial", size: 30)
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let titletxt:UILabel = {
       let label = UILabel()
        label.text = "Title :- "
        label.textColor = .black
        label.font = UIFont(name: "arial", size: 20)
        return label
    }()
    
    private let NewFileName:UITextField = {
       let email = UITextField()
        email.placeholder = "Enter Your File Name"
        email.textAlignment = .center
        email.textColor = .blue
        email.backgroundColor = .gray
        email.layer.cornerRadius = 15
        email.alpha = 0.8
        return email
    } ()
    
    
    private let fileDatatxt:UITextField = {
       let email = UITextField()
        email.placeholder = "Enter Something"
        email.backgroundColor = .gray
        email.alpha = 0.7
        email.textAlignment = .left
        email.layer.cornerRadius = 15
        return email
    } ()
    
    private let btnSaveFile:UIButton = {
         let btn = UIButton()
         btn.setTitle("Save", for: .normal)
         btn.backgroundColor = .blue
         btn.addTarget(self, action: #selector(btnSaveNewFile), for: .touchUpInside)
        btn.layer.cornerRadius = 10
         return btn
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = .white
        view.addSubview(BGimage)
        navigationController?.isNavigationBarHidden = true
        
        
        view.addSubview(titletxt)
        view.addSubview(newnotelbl)
        view.addSubview(NewFileName)
        view.addSubview(fileDatatxt)
        view.addSubview(btnSaveFile)
        
        if updatefile != "" {
            btnSaveFile.setTitle("Update", for: .normal)
            newnotelbl.text = "Edit Note"
            NewFileName.text = updatefile.components(separatedBy: ".").first
            let filepath = FlServices.getDocDir().appendingPathComponent(self.updatefile)
            
            do
            {
                fileDatatxt.text = try String(contentsOf: filepath)
                
            }catch{
                print("Error while updating")
            }
            
        }
        
        
    }
    
    private let BGimage:UIImageView = {
           let img  = UIImageView(image: UIImage(named: "ouBG"))
           return img
       }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        BGimage.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        newnotelbl.frame = CGRect(x: 40, y: 70, width: 144, height: 45)
        titletxt.frame = CGRect(x: 40, y: 150, width: 64, height: 40)
        NewFileName.frame = CGRect(x: 120, y: 150, width: 200, height: 40)
        fileDatatxt.frame = CGRect(x: 40, y: 240, width: view.width - 80, height: 270)
        btnSaveFile.frame = CGRect(x: 150, y: 550, width: 80, height: 40)
        
         
    }

     @objc func btnSaveNewFile()
     {
        print("save")
        
        let fileName = NewFileName.text
        let fileData = fileDatatxt.text
        
        let filePath = FlServices.getDocDir().appendingPathComponent("\(fileName!).txt")
        
        do
        {
             try fileData?.write(to: filePath, atomically: true, encoding: .utf8)
            if updatefile != "" {
                let alert = UIAlertController(title: "Save", message: "File Save Successfully", preferredStyle: . alert)
                alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: {[weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                }))
                                          
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                    }
                
            }
            else
            {
                let alert = UIAlertController(title: "Save", message: "File Save Successfully", preferredStyle: . alert)
                alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: {[weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                }))
                           
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
            }
    
        }catch{
            print("Error")
        }
        
    }
    

}
