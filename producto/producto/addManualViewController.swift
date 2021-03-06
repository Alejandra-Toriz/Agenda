//
//  addManualViewController.swift
//  producto
//
//  Created by macbook on 11/26/18.
//  Copyright © 2018 potato. All rights reserved.
//

import UIKit

class addManualViewController: UIViewController {

    
    @IBOutlet weak var actividad: UITextField!
    @IBOutlet weak var pickerOutlet: UIDatePicker!
    
    var dateRegist: daySelected!
    var dateCollectionR = [daySelected]()
    var strDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pickerAction(_ sender: UIDatePicker) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        strDate = dateFormatter.string(from: pickerOutlet.date)

    }
    
    @IBAction func guardar(_ sender: UIButton) {
        
        let registD = UserDefaults.standard
        
        dateRegist = daySelected(day: actividad.text! , month: "Noviembre", description: strDate)
        
        if let listEvents = registD.value(forKey: "dateEvents") as? Data{
            let temp = try? PropertyListDecoder().decode(Array<daySelected>.self, from: listEvents)
            
            dateCollectionR = temp!
        }
        
        dateCollectionR.append(dateRegist)
        
        registD.set(try? PropertyListEncoder().encode(dateCollectionR), forKey: "dateEvents")
        
        print("Ya se registró")
        
        print(dateCollectionR)
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
