//
//  levelOneHomeViewController.swift
//  theRoomEndOfTheYearApp
//
//  Created by Jacob Davis on 4/4/23.
//

import UIKit

class levelOneHomeViewController: UIViewController {

    @IBOutlet weak var timerCountdownLabel: UILabel!
    @IBOutlet weak var handcuffBtn: UIButton!
    @IBOutlet weak var handcuffImage: UIImageView!
    @IBOutlet weak var axeCutoutImg: UIImageView!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var panViewImageOne: UIView!
    @IBOutlet weak var panViewImageTwo: UIView!
    
    @IBOutlet weak var panViewImageThree: UIView!
    
    @IBOutlet weak var panViewImageFour: UIView!
    
    @IBOutlet weak var panViewImageFive: UIView!
    
    @IBOutlet weak var lockImage: UIImageView!
    
    @IBOutlet weak var lockUIView: UIView!
    
    @IBOutlet weak var backGroundImg: UIImageView!
    
    @IBOutlet weak var bucketImg: UIImageView!
    
    @IBOutlet weak var axeBtn: UIButton!
    @IBOutlet weak var imageViewOne: UIView!
    @IBOutlet weak var imageViewTwo: UIView!
    @IBOutlet weak var imageViewThree: UIView!
    @IBOutlet weak var imageViewFour: UIView!
    @IBOutlet weak var imageViewFive: UIView!
    
    @IBOutlet weak var inventoryImageOne: UIImageView!
    @IBOutlet weak var inventoryImageTwo: UIImageView!
    @IBOutlet weak var inventoryImageThree: UIImageView!
    @IBOutlet weak var inventoryImageFour: UIImageView!
    @IBOutlet weak var inventoryImageFive: UIImageView!
    
    @IBOutlet weak var bucketBtn: UIButton!
    
    @IBOutlet weak var rightRoomBtn: UIButton!
    
    var goodTimer: Timer? = nil
    
    var counter1 = 600

    var timeLeft = 1000
    
    var keyUsed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer()
//        lockImage?.startGlowing(
//          color: .yellow,
//          duration: 1)
//        axeCutoutImg?.startGlowing(
//          color: .yellow,
//          duration: 1)
//        bucketImg?.startGlowing(
//          color: .yellow,
//          duration: 1)
        imageViewOne.layer.zPosition = -0.1
        imageViewTwo.layer.zPosition = -0.1
        imageViewThree.layer.zPosition = -0.1
        imageViewFour.layer.zPosition = -0.1
        imageViewFive.layer.zPosition = -0.1
        backGroundImg.layer.zPosition = -100
        rightRoomBtn.isEnabled = false
    }
//
    override func viewDidDisappear(_ animated: Bool) {
        lockImage.stopGlowing()
        axeCutoutImg.stopGlowing()
        bucketImg.stopGlowing()
        handcuffImage.stopGlowing()
    }
    override func viewDidAppear(_ animated: Bool) {
        print(inventoryArrayFound)
        checkInvArray()
        lockImage?.startGlowing(
          color: .yellow,
          duration: 1)
        handcuffImage?.startGlowing(
          color: .yellow,
          duration: 1)
        axeCutoutImg?.startGlowing(
          color: .yellow,
          duration: 1)
        bucketImg?.startGlowing(
          color: .yellow,
          duration: 1)
       
        
    }
//    @IBAction func moveImgOne(_ sender: UIPanGestureRecognizer) {
//        var point = sender.location(in: view)
//            inventoryImageOne.center = CGPoint(x:point.x, y: point.y)
//    }
    func secondsToMinutesSeconds(_ seconds: Int) -> (String) {
        return "\(seconds / 60):\(seconds % 3600 % 60)"
    }
    @IBAction func handcuffTapped(_ sender: UIButton) {
        inventoryArrayFound.append(4)
        checkInvArray()
        handcuffImage.isHidden = true
        handcuffBtn.isEnabled = false
        handcuffImage.stopGlowing()
    }
    @IBAction func axeTapped(_ sender: UIButton) {
        inventoryArrayFound.append(3)
        checkInvArray()
        axeCutoutImg.isHidden = true
        axeBtn.isEnabled = false
        axeCutoutImg.stopGlowing()
       
    }
    @IBAction func bucketTapped(_ sender: UIButton) {
        bucketBtn.isEnabled = false
        bucketImg.isHidden = true
        inventoryArrayFound.append(2)
        // create the alert
             
//        if inventoryArrayFound[0] == 2{
//            inventoryImageOne.image = UIImage(named: "rustyBucket")
//        } else if inventoryArrayFound[1] == 2{
//            inventoryImageTwo.image = UIImage(named: "rustyBucket")
//        }else if inventoryArrayFound[2] == 2{
//            inventoryImageThree.image = UIImage(named: "rustyBucket")
//        }else if inventoryArrayFound[3] == 2{
//            inventoryImageFour.image = UIImage(named: "rustyBucket")
//        }else if inventoryArrayFound[4] == 2{
//            inventoryImageFive.image = UIImage(named: "rustyBucket")
//        }
        
        checkInvArray()
        bucketImg.stopGlowing()
    }
    func countdownTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
//            print("timer fired!")
                       
            self.timeLeft -= 1
            
            timerCountdownLabel.text = String(self.timeLeft)
//            print(self.timeLeft)
                       
            if(self.timeLeft==700){
                timer.invalidate()
                let alert = UIAlertController(title: "Hint 1", message: "Some items may not be as useful as they seem", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                countdownTimer()
            } else if(self.timeLeft==400){
                        timer.invalidate()
                        let alert = UIAlertController(title: "Hint 2", message: "The barrel makes a rattling noise when you move past it", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        countdownTimer()
            }else if(self.timeLeft==100){
                timer.invalidate()
                let alert = UIAlertController(title: "Hint 3", message: "The lock at the right cell looks very similar to the key found in the barrel", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                countdownTimer()
    }
            
                      }
    }
//    func test(){
//        goodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(steve), userInfo: nil, repeats: true)
//         if conditionalLogic == 0 {
//             conditionalLogic += 1
//         } else {
//             conditionalLogic -= 1
//         }
//         goodTimer
//    }
//    @objc func steve(){
//        if counter1 == 595 || counter2 == 595{
//            playAlarmSound(songName: "alarmClock")
//            goodTimer?.invalidate()
////            label.text = "\(words.randomElement()!)"
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.fromValue = CGPoint(x: 400, y: -200)
//            animation.toValue = CGPoint(x: 400, y: view.center.y)
//            animation.duration = 0.5
//            animation.beginTime = CACurrentMediaTime() + 0.3
//    //        animation.repeatCount = 3
//            animation.autoreverses = true
////            sampleView.layer.add(animation, forKey: nil)
//        }
//        if conditionalLogic == 0{
//            counter1 -= 1
//            let couner1Display = secondsToMinutesSeconds(counter1)
//            p1.text = "\(couner1Display)"
//            p2.text = ""
//            imageView.image = UIImage(named: "timerTemplateLeftOn")
//        } else {
//            let counter2Display = secondsToMinutesSeconds(counter2)
//            counter2 -= 1
//            p2.text = "\(counter2Display)"
//            p1.text = ""
//            imageView.image = UIImage(named: "timerTemplateRightOn")
//        }
//    }
    @IBAction func goRightRoomBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "goRightCell", sender: nil)
    }
    @IBAction func moveInventoryImageOne(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        panViewImageOne.center = CGPoint(x:point.x, y: point.y)
        print(point)
        
        if inventoryArrayFound.count >= 1{
            if inventoryArrayFound[0] == 1 && panViewImageOne.frame.intersects(lockUIView.frame){
                print("hi")
                
                rightRoomBtn.isEnabled = true
                lockImage.image = UIImage(named: "lockUnlock")
                lockImage.stopGlowing()
                if keyUsed == 0{
                    let alert = UIAlertController(title: "Notification", message: "Door Unlocked", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                keyUsed += 1
//                performSegue(withIdentifier: "goRightCell", sender: nil)
                
            }
        }
    }
    
    
    @IBAction func moveInventoryImageTwo(_ sender: UIPanGestureRecognizer) {
        panViewImageTwo.center = sender.location(in: view)
//        var point = sender.location(in: view)
//        panViewImageTwo.center = CGPoint(x:point.x, y: point.y)
        if inventoryArrayFound[1] == 1 && panViewImageTwo.frame.intersects(lockUIView.frame){
            print("hi")
            rightRoomBtn.isEnabled = true
            lockImage.image = UIImage(named: "lockUnlock")
            lockImage.stopGlowing()
            if keyUsed == 0{
                let alert = UIAlertController(title: "Notification", message: "Door Unlocked", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            keyUsed += 1
//            performSegue(withIdentifier: "goRightCell", sender: nil)
       }
    }
    
    
    @IBAction func moveInventoryImageThree(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        panViewImageThree.center = CGPoint(x:point.x, y: point.y)
        if inventoryArrayFound[2] == 1 && panViewImageThree.frame.intersects(lockUIView.frame){
            print("hi")
            rightRoomBtn.isEnabled = true
            lockImage.image = UIImage(named: "lockUnlock")
            lockImage.stopGlowing()
            if keyUsed == 0{
                let alert = UIAlertController(title: "Notification", message: "Door Unlocked", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            keyUsed += 1
//            performSegue(withIdentifier: "goRightCell", sender: nil)
       }

    }
    
    @IBAction func moveInventoryImageFour(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        panViewImageFour.center = sender.location(in: view)
        if inventoryArrayFound[3] == 1 && panViewImageFour.frame.intersects(lockUIView.frame){
            print("hi")
            rightRoomBtn.isEnabled = true
            lockImage.image = UIImage(named: "lockUnlock")
            lockImage.stopGlowing()
            if keyUsed == 0{
                let alert = UIAlertController(title: "Notification", message: "Door Unlocked", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            keyUsed += 1
//            performSegue(withIdentifier: "goRightCell", sender: nil)
       }
    }
    
    @IBAction func moveInventoryImageFive(_ sender: UIPanGestureRecognizer) {
        if inventoryArrayFound[0] == 5 && panViewImageOne.frame.intersects(lockUIView.frame){
            print("hi")
            rightRoomBtn.isEnabled = true
            lockImage.image = UIImage(named: "lockUnlock")
            lockImage.stopGlowing()
            if keyUsed == 0{
                let alert = UIAlertController(title: "Notification", message: "Door Unlocked", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            keyUsed += 1
//            performSegue(withIdentifier: "goRightCell", sender: nil)
       }
    }
    
    @IBAction func zoomOnLeftHallway(_ sender: UIButton) {
        backGroundImg.image = UIImage(named: "leftZoom")
    }
    
    
    
    
    
    
    
    
    func checkInvArray(){
        if inventoryArrayFound.count == 1 {
            if inventoryArrayFound[0] == 1{
                inventoryImageOne.image = UIImage(named: "key")
            } else if inventoryArrayFound[0] == 2{
                inventoryImageOne.image = UIImage(named: "rustyBucket")
            }else if inventoryArrayFound[0] == 3{
                inventoryImageOne.image = UIImage(named: "useAxe")
            }else if inventoryArrayFound[0] == 4{
                inventoryImageOne.image = UIImage(named: "handCuffTest")
            }else if inventoryArrayFound[0] == 5{
                inventoryImageOne.image = UIImage(named: "")
            }
        } else if inventoryArrayFound.count == 2 {
            if inventoryArrayFound[1] == 1{
                inventoryImageTwo.image = UIImage(named: "key")
            } else if inventoryArrayFound[1] == 2{
                inventoryImageTwo.image = UIImage(named: "rustyBucket")
            }else if inventoryArrayFound[1] == 3{
                inventoryImageTwo.image = UIImage(named: "useAxe")
            }else if inventoryArrayFound[1] == 4{
                inventoryImageTwo.image = UIImage(named: "handcuffInvImg")
            }else if inventoryArrayFound[1] == 5{
                inventoryImageTwo.image = UIImage(named: "")
            }
        }
        else if inventoryArrayFound.count == 3 {
            if inventoryArrayFound[2] == 1{
                inventoryImageThree.image = UIImage(named: "key")
            } else if inventoryArrayFound[2] == 2{
                inventoryImageThree.image = UIImage(named: "rustyBucket")
            }else if inventoryArrayFound[2] == 3{
                inventoryImageThree.image = UIImage(named: "useAxe")
            }else if inventoryArrayFound[2] == 4{
                inventoryImageThree.image = UIImage(named: "handcuffInvImg")
            }else if inventoryArrayFound[2] == 5{
                inventoryImageThree.image = UIImage(named: "")
            }
        }
        else if inventoryArrayFound.count == 4 {
            if inventoryArrayFound[3] == 1{
                inventoryImageFour.image = UIImage(named: "key")
            } else if inventoryArrayFound[3] == 2{
                inventoryImageFour.image = UIImage(named: "rustyBucket")
            }else if inventoryArrayFound[3] == 3{
                inventoryImageFour.image = UIImage(named: "useAxe")
            }else if inventoryArrayFound[3] == 4{
                inventoryImageFour.image = UIImage(named: "handcuffInvImg")
            }else if inventoryArrayFound[3] == 5{
                inventoryImageFour.image = UIImage(named: "")
            }
        }
        else if inventoryArrayFound.count == 5 {
            if inventoryArrayFound[4] == 1{
                inventoryImageFive.image = UIImage(named: "key")
            } else if inventoryArrayFound[4] == 2{
                inventoryImageFive.image = UIImage(named: "rustyBucket")
            }else if inventoryArrayFound[4] == 3{
                inventoryImageFive.image = UIImage(named: "useAxe")
            }else if inventoryArrayFound[4] == 4{
                inventoryImageFive.image = UIImage(named: "handcuffInvImg")
            }else if inventoryArrayFound[4] == 5{
                inventoryImageFive.image = UIImage(named: "")
            }
        }
           
    }

}
