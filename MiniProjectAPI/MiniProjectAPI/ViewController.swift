//
//  ViewController.swift
//  MiniProjectAPI
//
//  Created by khalid ali on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttontest(_ sender: UIButton) {
        getInfo()
    }
    func getInfo() {
        let headers = [
            "x-rapidapi-host": "numbersapi.p.rapidapi.com",
            "x-rapidapi-key": "f85098bb3amsh3e6c09680f045ddp12a040jsn41075131d397"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://numbersapi.p.rapidapi.com/1492/year?fragment=true&json=true")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                        print(httpResponse)
                //  read json in data
                do {
                    let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
//                    print("Result",resultJson!)
                    if let alb = resultJson!["text"] {
                        print(alb)
                        
                        DispatchQueue.main.sync(execute: {
                            self.textFieldText.text = alb as? String
                        })
                    }
//                    if let alb2 = resultJson!["type"] {
//                        print(alb2)
//                    }
//                    if let alb3 = resultJson!["number"] {
//                        print(alb3)
//                    }
                } catch {
                    print("Error -> \(error)")
                }
            }
        })
        dataTask.resume()
        
    }
    
}


