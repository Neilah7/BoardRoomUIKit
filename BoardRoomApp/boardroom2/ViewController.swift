//
//  ViewController.swift
//  boardroom2
//
//  Created by leena alajlani on 13/03/2023.
//

import UIKit
//import ArgumentParser


class ViewController: UIViewController {
    var iconClick = false
    let imageicon = UIImageView()
   
    @IBOutlet  var mytextfiled: UITextField!
    @IBOutlet weak var jobNumber: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let localData = self.readLocalFile(forName: "data") {
//            self.parse(jsonData: localData)
//        }
//        let urlString = "https://raw.githubusercontent.com/programmingwithswift/ReadJSONFileURL/master/hostedDataFile.json"
//
//        self.loadJson(fromURLString: urlString) { (result) in
//            switch result {
//            case .success(let data):
//                self.parse(jsonData: data)
//            case .failure(let error):
//                print(error)
//            }
//        }
//        mytextfiled.translatesAutoresizingMaskIntoConstraints
        
        imageicon.image=UIImage(named: "openEye")

        let contentView = UIView()
        contentView.addSubview(imageicon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closeEye")!.size.width, height: UIImage(named: "closeEye")!.size.height)
        
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "closeEye")!.size.width, height: UIImage(named: "closeEye")!.size.height)
        
        mytextfiled.rightView = contentView
        mytextfiled.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(TapGestureRecognizer:)))
        
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        //enter app
        if jobNumber.text == "101010" || mytextfiled.text == "secret" {
                    performSegue(withIdentifier: "MainScreen", sender: AnyObject.self)
                    
                } else if jobNumber.text == "112233" || mytextfiled.text == "secret" {
                    performSegue(withIdentifier: "MainScreen", sender: AnyObject.self)
                    
                }else if jobNumber.text == "445566" || mytextfiled.text == "secret" {
                    performSegue(withIdentifier: "MainScreen", sender: AnyObject.self)}
                else if jobNumber.text == "778899" || mytextfiled.text == "secret" {
                    performSegue(withIdentifier: "MainScreen", sender: AnyObject.self)}
        
        
//        self.modalPresentationStyle = .fullScreen//
    }
    
    
    @objc func imageTapped(TapGestureRecognizer:UITapGestureRecognizer){
        let tappedImage = TapGestureRecognizer.view as! UIImageView
        if iconClick
        {
            iconClick = false
            tappedImage.image = UIImage(named: "openEye")
            mytextfiled.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image=UIImage(named: "closeEye")
            mytextfiled.isSecureTextEntry = true
            
            
            
            
        }
    }

}
struct Boardroom: Decodable{
    let id: URL
    let name: String
    let facilities: String
    let floor_no: Int
    let description: String
    let image_url: URL
    let no_of_seats: Int
    
}
//new
struct Employees: Codable{
    let id: Int
    let name: String
    let job_title: String
    let Password: String
}
struct Bookings: Decodable{
    let id: URL
    let name: String
    let facilities: String
    let floor_no: Int
    let description: String
    let image_url: URL
    let no_of_seats: Int
    let date: Int
    let message: String
    let error: Bool
}

func fetch_Boardroom ()
{
    let baseURL = "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
    let url = URL(string: baseURL+"/Get_all_boardroom")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let Boardroom = try? JSONDecoder().decode( [Boardroom].self, from:
                                                            data) {
                print (Boardroom)
            } else {
                print ("Invalid Response")
            }
        } else if let error = error {
            print ("HTTP Request Failed \(error)")
        }
    }
    task.resume()
}

func fetch_Employees ()
{
    let baseURL = "https://ac2b02b3-cede-4dfd-90df-aa78f688cb6e.mock.pstmn.io"
    let url = URL(string: baseURL+"/bookings/employee/:empID/")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let Employees = try? JSONDecoder().decode( [Employees].self, from:
                                                            data) {
                print (Employees)
            } else {
                print ("Invalid Response")
            }
        } else if let error = error {
            print ("HTTP Request Failed \(error)")
        }
    }
    task.resume()
}
struct ResponseData: Decodable {
    var employee: [Employees]
}


func loadJson(filename fileName: String) -> [Employees]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.employee
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}
private func parse(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode(Employees.self,
                                                   from: jsonData)
        
        print("id: ", decodedData.id)
        print("Password: ", decodedData.Password)
        print("welcome")
    } catch {
        print("decode error")
    }
}
private func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        
        urlSession.resume()
    }
}

