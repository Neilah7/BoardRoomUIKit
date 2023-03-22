//
//  endFlowViewController.swift
//  boardroom2
//
//  Created by leena alajlani on 16/03/2023.
//

import UIKit

class endFlowViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var BoxRadius: UITextView!
    
    
    override func viewDidLoad() {
        BoxRadius.layer.cornerRadius = 10
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func BackToMain(_ sender: Any) {
        performSegue(withIdentifier: "Done", sender: self)
    }
    
}
