//
//  DetailsViewController.swift
//  boardroom2
//
//  Created by leena alajlani on 16/03/2023.
//

import UIKit

class DetailsViewController: UIViewController {

   
        
        
        @IBOutlet weak var fieldRaduis: UITextView!
        @IBOutlet weak var bookingBtn: UIButton!
        
        
        override func viewDidLoad() {
            navigationController?.navigationBar.barTintColor = UIColor.green
            
            //TextView appearance
            fieldRaduis.layer.cornerRadius = 4
            
            //TextView appearance
            bookingBtn.tintColor = UIColor(named: "ButtonColor")
            bookingBtn.layer.cornerRadius = 10
            
            super.viewDidLoad()
        }
        
        
        @IBAction func bookingAction(_ sender: Any) {
            performSegue(withIdentifier: "Details", sender: self)
            
            ////
            ///
            
        }


}
