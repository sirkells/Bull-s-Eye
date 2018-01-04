//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Kelechi Igbokwe on 16.12.17.
//  Copyright © 2017 Kelechi Igbokwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// Slider button and initial val
    @IBOutlet weak var slider: UISlider!
    var currentValue = 0
   // targetNumber button and initial value
    @IBOutlet weak var targetNumber: UILabel!
     var targetValue = 0
    @IBOutlet weak var scoreLabel: UILabel!
        var score = 0
    @IBOutlet weak var roundLabel: UILabel!
    var round = 0
    @IBAction func restartButton(_ sender: UIButton) {
        round = 0
        score = 0
        restartGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        restartGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") //UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") //UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") //UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") //UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel() {
        targetNumber.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func restartGame() {
        round = round + 1
        currentValue = 50
        targetValue = Int(arc4random_uniform(101))
        slider.value = Float(currentValue)
        updateLabel()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var point = 0
        
        
        let title : String
        if difference == 0 {
            title = "Perfect"
            point = point + 100
            //score = score + 100
            
        }
        else if difference > 1 && difference < 5 {
            title = "Nice Job"
            point += 10
        }
        else if difference <= 1 {
            title = "Wow!! You Were So Close"
            //score = score + 50
            point = point + 50
        }
        else {
            title = "Not even close"
        }
        score = score + point
      

        let message = "You Scored: \(point) Points"
        let alert = UIAlertController(title: title, message: "\(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default, handler: {
            action in
            self.restartGame()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //restartGame()
    
    }
}

