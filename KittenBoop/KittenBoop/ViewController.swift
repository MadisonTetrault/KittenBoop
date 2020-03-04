//
//  ViewController.swift
//  KittenBoop
//
//  Created by Tetrault, Madison R on 2/26/20.
//  Copyright © 2020 Tetrault, Madison R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //variables
    var name:String = ""
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false
    var score:Int = 0
    var rating:Int = 0
    
    //outlets
    
    @IBOutlet weak var yourName: UITextField!
    
    @IBOutlet weak var gameRules: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var oneKitten: UIButton!
    
    @IBOutlet weak var twoKitten: UIButton!
    
    @IBOutlet weak var threeKitten: UIButton!
    
    @IBOutlet weak var fourKitten: UIButton!
    
    @IBOutlet weak var fiveKitten: UIButton!
    
    @IBOutlet weak var cuteQuestion: UILabel!
    
    @IBOutlet weak var cuteSlider: UISlider!
    
    @IBOutlet weak var cuteRatings: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var goHidden: UIButton!
    
    //actions
    
    @IBAction func letsPlay(_ sender: Any) {
        name = yourName.text!
        gameRules.text = "Welcome, \(name)! You'll have 30 seconds to boop as many kittens as possible. Press 'Go' to start the timer!"
        yourName.resignFirstResponder()
        goHidden.isHidden = false
  }
    
    
    @IBAction func startGame(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            oneKitten.isHidden = false
            twoKitten.isHidden = false
            threeKitten.isHidden = false
            fourKitten.isHidden = false
            fiveKitten.isHidden = false
        
        }
    }
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
                }
        
    @objc func updateTimer() {
            counter -= 1
            timerLabel.text = "Time left: \(counter)"
            if(counter == 0) {
                timerLabel.text = "Time's Up!"
                timer.invalidate()
                oneKitten.isHidden = true
                twoKitten.isHidden = true
                threeKitten.isHidden = true
                fourKitten.isHidden = true
                fiveKitten.isHidden = true
                cuteQuestion.isHidden = false
                cuteSlider.isHidden = false
                cuteRatings.isHidden = false
                resetButton.isHidden = false
        }
        }
    
    func didScore(points:Int){
    score = score + points
    myScore.text = "Score: \(score)"
    
    }
    

    @IBAction func kittenOne(_ sender: Any) {
          didScore(points:1)
          oneKitten.isHidden = true
      DispatchQueue.main.asyncAfter(deadline: .now () + 1) {
              self.oneKitten.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now () + 5) {
            self.oneKitten.isHidden = true
        }
          }
        }
      
      @IBAction func kittenTwo(_ sender: Any) {
          didScore(points: 5)
           twoKitten.isHidden = true
          
      DispatchQueue.main.asyncAfter(deadline: .now () + 2) {
          self.twoKitten.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now () + 4) {
            self.twoKitten.isHidden = true
        }                 }    }
      
      @IBAction func kittenThree(_ sender: Any) {
          didScore(points: 10)
           threeKitten.isHidden = true
      DispatchQueue.main.asyncAfter(deadline: .now () + 3) {
          self.threeKitten.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now () + 3) {
            self.threeKitten.isHidden = true
        }                 }    }
      
      @IBAction func kittenFour(_ sender: Any) {
          didScore(points: 15)
        fourKitten.isHidden = true

      DispatchQueue.main.asyncAfter(deadline: .now () + 5) {
          self.fourKitten.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now () + 2) {
            self.fourKitten.isHidden = true
        }                         }}
      
      @IBAction func kittenFive(_ sender: Any) {
          didScore(points: 20)
      fiveKitten.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now () + 1) {
            self.fiveKitten.isHidden = true
        

          DispatchQueue.main.asyncAfter(deadline: .now () + 6) {
          self.fiveKitten.isHidden = false
            }}
            
          
      }
    

    @IBAction func howCute(_ sender: UISlider) {
        rating = Int(sender.value)
        myScore.text = "Score: \(score + rating)"
    }
    
    @IBAction func myReset(_ sender: Any) {
        score = 0
        myScore.text = "Score: \(score)"
        timer.invalidate()
        counter = 30
        timerLabel.text = "Time Left: \(counter)"
        isTimerRunning = false
        cuteQuestion.isHidden = true
        cuteSlider.isHidden = true
        cuteRatings.isHidden = true
        resetButton.isHidden = true
        oneKitten.isHidden = false
        twoKitten.isHidden = false
        threeKitten.isHidden = false
        fourKitten.isHidden = false
        fiveKitten.isHidden = false    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goHidden.isHidden = true
        oneKitten.isHidden = true
        twoKitten.isHidden = true
        threeKitten.isHidden = true
        fourKitten.isHidden = true
        fiveKitten.isHidden = true
        cuteQuestion.isHidden = true
        cuteSlider.isHidden = true
        cuteRatings.isHidden = true
        resetButton.isHidden = true
        
    }

}

