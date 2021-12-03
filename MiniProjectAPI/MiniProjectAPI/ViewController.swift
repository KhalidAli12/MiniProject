//
//  ViewController.swift
//  MiniProjectAPI
//
//  Created by khalid ali on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var textFieldText: UITextField!
    @IBOutlet weak var textFieldFound: UITextField!
    @IBOutlet weak var textview2: UITextView!
    @IBOutlet weak var labeType: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        getDate1()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func buttontest(_ sender: UIButton) {
        getInfo()
        getDate1()
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
                print(error as Any)
            } else {
                //                let httpResponse = response as? HTTPURLResponse
                //                        print(httpResponse)
                //  read json in data
            }
            do {
                let result = try JSONDecoder().decode(GetAPI.self, from: data!)
                DispatchQueue.main.async {
//                    print(result.text!)
                    self.textview.text = result.text
//                    print(result.number!)
                    self.textFieldText.text = result.number?.description
//                    print(result.found!)
                    self.textFieldFound.text = result.found?.description
                    self.labeType.text = result.type?.description
                }
            } catch {
                print("Error -> \(error)")
            }
        })
        dataTask.resume()
    }
func getDate1() {
    let headers = [
        "x-rapidapi-host": "numbersapi.p.rapidapi.com",
        "x-rapidapi-key": "f85098bb3amsh3e6c09680f045ddp12a040jsn41075131d397"
    ]
    
    var request = URLRequest(url: URL(string: "https://numbersapi.p.rapidapi.com/6/21/date?fragment=true&json=true")!)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask1 = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error as Any)
        } else {
            //                let httpResponse = response as? HTTPURLResponse
            //                        print(httpResponse)
            //  read json in data
        }
        do {
            let result2 = try JSONDecoder().decode(GetAPI2.self, from: data!)
            DispatchQueue.main.async {
//                print(result2.text ?? "")
                self.textview2.text = result2.text
//                print(result.number!)
                self.labelYear.text = result2.year?.description
//                print(result.found!)
//                self.textFieldFound.text = result.found?.description
            }
        } catch {
            print("Error -> \(error)")
        }
    })
    dataTask1.resume()

}

    
    
}
struct GetAPI : Codable {
var number : Int?
var text : String?
var found : Bool?
var type : String?
}


struct GetAPI2 : Codable {
    var year : Int?
    var text : String?
//    var found2 : Bool?
}


  

