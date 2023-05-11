//
//  ViewController.swift
//  theRoomEndOfTheYearApp
//
//  Created by Jacob Davis on 4/4/23.
//

import UIKit

var  inventoryArrayFound: [Int] = []
//Key is a 1


class ViewController: UIViewController {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightDoor: UIImageView!
    var doubleTap: Bool! = false
    var counter = 0
    
    @IBOutlet weak var levelOneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelOneButton.isEnabled = false
        let singleFingerTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleSingleTap(_:)))
        self.view.addGestureRecognizer(singleFingerTap)
    }
    @objc func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
        levelOneButton.isEnabled = false
//            if (doubleTap) {
//            UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
//                var basketTopFrame = self.topImage.frame
//                basketTopFrame.origin.y += basketTopFrame.size.height
//
//                var basketBottomFrame = self.bottomImage.frame
//                basketBottomFrame.origin.y -= basketBottomFrame.size.height
//
//                self.topImage.frame = basketTopFrame
//                self.bottomImage.frame = basketBottomFrame
//            }, completion: { finished in
//                print("Images Moved back!")
//            })
//                doubleTap = false
//            }
//        else {
        if counter == 0 {
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
                    var basketTopFrame = self.leftImage.frame
                    basketTopFrame.origin.x -= 74

                    var basketBottomFrame = self.rightDoor.frame
                    basketBottomFrame.origin.x += 77

                    self.leftImage.frame = basketTopFrame
                    self.rightDoor.frame = basketBottomFrame
                }, completion: { finished in
                    self.counter += 1
                    self.levelOneButton.isEnabled = true
                    print("Images sperated!")
                })
                doubleTap = true
        } else if counter == 1{
            UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
                var basketTopFrame = self.leftImage.frame
                basketTopFrame.origin.x += 75
                
                var basketBottomFrame = self.rightDoor.frame
                basketBottomFrame.origin.x -= 77
                
                self.leftImage.frame = basketTopFrame
                self.rightDoor.frame = basketBottomFrame
            }, completion: { finished in
                self.counter -= 1
                self.levelOneButton.isEnabled = false
                print("Images sperated!")
            })
            doubleTap = true
        }
        }


}

