//
//  NotesVC.swift
//  iNotes
//
//  Created by Nick patel on 21/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {
    
    private let myLabel:UILabel = {
       let label = UILabel()
        label.text = "Notes"
        label.textColor = .black
        label.font = UIFont(name: "arial", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    private var NArray = [String]()
    
    public let mytableView = UITableView()
    

    private func fetchData()
    {
        let path = FlServices.getDocDir()
        print(path)
        
        do {
            
            let fileName = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            for item in fileName {
                NArray.append(item.lastPathComponent)
            }
            
        }catch{
            print("File not found!")
        }
        mytableView.reloadData()
    }
    
    
    
     private let logoutbtn:UIButton = {
           let btn = UIButton()
            let icon = UIImage(named: "logouticon")
        btn.setImage(icon, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
           btn.setTitle("Log Out", for: .normal)
        btn.setTitleColor(.red, for: .normal)
          
           btn.addTarget(self, action: #selector(btnlogout), for: .touchUpInside)
           return btn
       }()
    
     
    
    private let btnNewFile:UIButton = {
           let btn = UIButton()
           btn.setTitle("Add New", for: .normal)
        btn.backgroundColor = .purple
           btn.layer.cornerRadius = 20
         btn.addTarget(self, action: #selector(btnAddNewFile), for: .touchUpInside)
           return btn
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(myLabel)
        view.addSubview(logoutbtn)
        view.addSubview(mytableView)
        
        view.addSubview(btnNewFile)
        
        setupTable()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame  = CGRect(x: 40, y: 70, width: 100, height: 30)
        logoutbtn.frame  = CGRect(x: 250, y: 65, width: 130, height: 30)
        btnNewFile.frame  = CGRect(x: 120, y: 580, width: 140, height: 40)
        mytableView.frame  = CGRect(x: 30, y: 130, width: view.width - 60, height: view.height - 150)
        
    }
     
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        checkUser()
        fetchData()
    }
    func checkUser()
    {
        print("Checking User Status")
        
        if let Token = UserDefaults.standard.string(forKey: "TokenValue"), let user = UserDefaults.standard.string(forKey: "email") {
            print("User logged in")
            print(Token)
            print(user)
        }
        else
        {
            navigationController?.pushViewController(MainVC(), animated: true)
        }
        
    }
    
    @objc func btnlogout()
    {
        UserDefaults.standard.setValue(nil, forKey: "TokenValue")
        UserDefaults.standard.setValue(nil, forKey: "email")
        checkUser()
    }
    
    @objc func btnAddNewFile()
    {
       let vc = NewFileVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension NotesVC : UITableViewDelegate , UITableViewDataSource {
    
    private func setupTable()
    {
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: "NArray")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = mytableView.dequeueReusableCell(withIdentifier: "NArray", for: indexPath)
        cell.textLabel?.text = NArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        
            let fileName = NArray[indexPath.row]
            let filePath = FlServices.getDocDir()
            
            let path = URL(string: fileName, relativeTo: filePath)
            
            do
            {
                try FileManager.default.removeItem(at: path!)
                 
                  let alert = UIAlertController(title: "Delete", message: "File Delete Successfully", preferredStyle: . alert)
                          alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: {[weak self] _ in
                            self?.mytableView.reloadData()
                          }))
                          
                          DispatchQueue.main.async {
                              self.present(alert, animated: true)
                          }            }
            
            catch{
                print("File Deleting Error")
            }
            
        
       
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewFileVC()
        vc.updatefile = NArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
