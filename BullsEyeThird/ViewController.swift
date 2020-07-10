//
//  ViewController.swift
//  BullsEyeSecond
//
//  Created by Jumpei Takeshita on 2020/07/09.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0


    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        starOver()
        
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }
    
    @IBAction func hitMeButton() {
        //it never change, so this is defined with "let"
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "ほんまにおめでとう！こればっかりは頭が上がりませんわ！"
            points += 100
        } else if difference == 1 {
            title = "ゲロ惜しい！次のラウンドで頑張れ！！"
            points += 50
        } else if difference <= 5 {
            title = "惜しいですね〜。Keep it up!"
        } else if difference <= 10 {
            title = "悪くはないけど、もうちょいいけたんとちゃうんか？"
        } else {
            title = "オメェはホームレスのぺぇずりでもしとけこの人間のゴミが！！"
        }
        
        let message: String
        if difference <= 5 {
            message = "\(points)ポイント獲得しました！！"
        } else if difference <= 10 {
            message = "\(points)ポイント獲得。"
        } else {
            message = "\(points)ポイント獲得…。なめてんの？"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        //To check if its properly working
        print("targetValue: " + String(targetValue))
        print("currentValue: " + String(currentValue))
        print("difference: " + String(difference))
        print("points: " + String(points))
        
        score += points
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    
    @IBAction func startOverButton() {
        starOver()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func starOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
}

