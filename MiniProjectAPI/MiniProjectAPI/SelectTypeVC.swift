//
//  SelectTypeVC.swift
//  MiniProjectAPI
//
//  Created by khalid ali on 02/05/1443 AH.
//

import UIKit

class SelectTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onlineButton(_ sender: UIButton) {
       let moving =  storyboard?.instantiateViewController(withIdentifier: "Connect")as! ViewController
        moving.isOnline = true
        navigationController?.pushViewController(moving, animated: true)
    }
    
    
    @IBAction func offlineButton(_ sender: UIButton) {
        let movingTo = storyboard?.instantiateViewController(withIdentifier: "Connect") as! ViewController
        movingTo.isOnline = false
        navigationController?.pushViewController(movingTo, animated: true)
        
    }
    
    
    
}
