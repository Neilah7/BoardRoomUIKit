//
//  MainScreen.swift
//  BoardroomApp
//
//  Created by maryam almijlad on 21/03/2023.
//

import UIKit

class MainScreen: UIViewController {
    let products: [Product] = [
        Product(productName: "Creative Space", productImage: "image2", productDescription: "Floor 5" , buttonn : "image2" ,available: "Available"),
        Product(productName: "Creative Space", productImage: "image2", productDescription: "Floor 5" ,buttonn : "image2" ,available: "Available"),
        Product(productName: "Creative Space", productImage: "image2", productDescription: "Floor 5" , buttonn : "image2" ,available: "Available")
        
        
    ]
    
    var calenderDays: [Calender] = [
        Calender(day: "Thu", date: "16"),
        Calender(day: "Sun", date: "19"),
        Calender(day: "Mon", date: "20"),
        Calender(day: "Tue", date: "21"),
        Calender(day: "Wed", date: "22"),
        Calender(day: "Thu", date: "23"),
        
        Calender(day: "Sun", date: "26"),
        Calender(day: "Mon", date: "27"),
        Calender(day: "Tue", date: "28"),
        Calender(day: "Wed", date: "29"),
        Calender(day: "Thu", date: "30"),
        Calender(day: "Sun", date: "31")
    ]

   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    

    

}

struct Calender{
    var day : String
    var date : String
}

struct Product : Decodable {
    var productName: String
    var productImage: String
    var productDescription: String
    var buttonn : String
    var available : String
   
}
class CalenderCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayss: UILabel!
    
   
    @IBOutlet weak var datee: UILabel!
    
   
    
}
class TableViewCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productDesc: UILabel!
   

  
    @IBOutlet weak var iimm: UIImageView!
    
    @IBOutlet weak var availableL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Edit available label
      
       // availableL.textColor = .white
       // availableL.clipsToBounds = true
      //  availableL.layer.cornerRadius = availableL.frame.height/2
        
      //  if availableL.text != "Unavailable" {
       //     availableL.backgroundColor = .black
       // } else if availableL.text == "Unavailable" {
       //     availableL.backgroundColor = .blue
      //  }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MainScreen: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        calenderDays.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calenderCell", for: indexPath) as! CalenderCellCollectionViewCell
        
        
        cell.dayss.text = calenderDays[indexPath.row].day
        cell.datee.text = calenderDays[indexPath.row].date
        
        cell.dayss.layer.cornerRadius = cell.datee.frame.width/2
      
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    
    
    
}










//TableView
extension MainScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        
        cell.productImage.image = UIImage(named: products[indexPath.row].productImage)
        cell.productName.text = products[indexPath.row].productName
        cell.productDesc.text = products[indexPath.row].productDescription
        cell.layer.cornerRadius=10
        cell.availableL.text = products[indexPath.row].available
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("this row \(indexPath.row) is selected")
        performSegue(withIdentifier: "Room", sender: AnyObject.self)
    }
    
}


