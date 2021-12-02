//
//  ViewController.swift
//  MiniProjectAPI
//
//  Created by khalid ali on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
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
        
        var request = URLRequest(url: URL(string: "https://numbersapi.p.rapidapi.com/1492/year?fragment=true&json=true")!)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
//                        print(httpResponse)
                //  read json in data
            }
                do {
                    let result = try JSONDecoder().decode(GetAPI.self, from: data!)

                    DispatchQueue.main.async {
                        print(result.text)
                        self.textFieldText.text = result.text
                    }
                } catch {
                    print("Error -> \(error)")
                }
        })
        dataTask.resume()
    }
}

class GetAPI : Codable {
        var year : Int?
        var text : String?
}


