//
//  bottomBarrelViewController.swift
//  theRoomEndOfTheYearApp
//
//  Created by Jacob Davis on 4/13/23.
//

import UIKit

var keyFound = false

class bottomBarrelViewController: UIViewController {

    @IBOutlet weak var keyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func keyTapped(_ sender: UIButton) {
        keyBtn.isEnabled = false
        keyFound = true
        inventoryArrayFound.append(1)
    }
    
    
}
