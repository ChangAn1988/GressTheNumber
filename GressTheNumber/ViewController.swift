//
//  ViewController.swift
//  GressTheNumber
//
//  Created by 陳昶安 on 2016/10/26.
//  Copyright © 2016年 ANAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessNumber: UITextField!
    
    @IBOutlet weak var redPrompt: UILabel!
    
    @IBOutlet weak var bluePrompt: UILabel!
    
    var numOfTimes:Int = 7
    
    var ansNum = (arc4random() % 21)
    
    @IBAction func guessButton(_ sender: AnyObject) {
        
        print("答案是\(ansNum)")
        
        if Int(guessNumber.text!) == nil || guessNumber.text! == ""
            || Int(guessNumber.text!)! < 0 || Int(guessNumber.text!)! > 20{
            
            redPrompt.text = "請輸入0~20範圍內的數字~!"
            
            redPrompt.isHidden = false
            
        } else if Int(guessNumber.text!)! >= 0 && Int(guessNumber.text!)! <= 20 {
            
            if numOfTimes >= 2 && numOfTimes <= 7 && Int(ansNum) == Int(guessNumber.text!)! {
                
                redPrompt.isHidden = false
                
                redPrompt.text = "你在第\(8 - numOfTimes)次時猜對了！"
                
                bluePrompt.text = "YOU WIN"
                
                numOfTimes = 8
                
                
            } else {
                
                if numOfTimes >= 3 && numOfTimes <= 7 && Int(ansNum) > Int(guessNumber.text!)!{
                    
                    redPrompt.isHidden = false
                    
                    redPrompt.text = "猜錯了，太小了"
                    
                    numOfTimes -= 1
                    
                    bluePrompt.text = "還剩下\(numOfTimes - 1)次"
                    
                    //numOfTimes -= 1
                    
                } else if numOfTimes >= 3 && numOfTimes <= 7 && Int(ansNum) < Int(guessNumber.text!)! {
                    
                    redPrompt.isHidden = false
                    
                    redPrompt.text = "猜錯了，太大了"
                    
                    numOfTimes -= 1
                    
                    bluePrompt.text = "還剩下\(numOfTimes - 1)次"
                    
                    //numOfTimes -= 1
                
                } else if numOfTimes == 2{
                    
                    redPrompt.isHidden = false
                    
                    redPrompt.text = "次數用盡了，你輸了"
                    
                    bluePrompt.text = "YOU LOSE"
                    
                    numOfTimes = 8
                    
                } else if numOfTimes == 8 {
                    
                    redPrompt.text = "再玩一場？請按下方「重新玩」"
                    
                }
            }
        }
    }
    
    @IBAction func rePlayBtn(_ sender: AnyObject) {
        
        redPrompt.isHidden = true
        
        bluePrompt.text = "可以猜6次"
        
        numOfTimes = 7
        
        ansNum = (arc4random() % 21)
        
        guessNumber.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
