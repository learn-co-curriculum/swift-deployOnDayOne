//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initGame()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchedSquare(_ sender: UIButton) {
        //print("touched \(sender.tag)")
        onClickSquare(tagName:sender.tag, button: sender);
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        //print("touched \(sender.tag)")
        initGame();
    }
    
    var gameStatus: [Int: String] = [:]
    
    func initGame(){
        gameStatus = [1:"",2:"", 3:"", 4:"", 5:"", 6:"", 7:"", 8:"", 9:""]
        let allSquares = Array(gameStatus.keys)
        for square in allSquares {
            let button = self.view.viewWithTag(square) as? UIButton
            if let button = button {
                button.isEnabled = true
                button.setTitle("", for: UIControlState.normal)
                button.setTitleColor(UIColor.brown, for: UIControlState.normal)
            }
        }
        // disable play again button (tag = 20)
        let button = self.view.viewWithTag(20) as? UIButton
        if let button = button {
            button.isEnabled = false
        }
        // set label
        let winLabel = self.view.viewWithTag(10) as? UILabel
        if let winLabel = winLabel {
            winLabel.text = "Start Playing"
        }
    }

    func onClickSquare (tagName: Int, button: UIButton) {
        
        button.setTitle("x", for: UIControlState.normal)
        button.isEnabled = false
        gameStatus[tagName] = "x"
        
        if findWinner() {
            gameOver()
        } else {
            machinePlay()
        }
    }
    
    func gameOver(){
        // 1. get an array of unused squares
        var unusedSquaresDict = gameStatus // copy the original dictionary
        unusedSquaresDict.forEach { if $1 != "" { unusedSquaresDict[$0] = nil } }  // filter out values that do not match
        let unusedSquaresInts: [Int] = Array(unusedSquaresDict.keys)
        for unusedSquare in unusedSquaresInts {
            let button = self.view.viewWithTag(unusedSquare) as? UIButton
            if let button = button {
                button.isEnabled = false
            }
        }
        // enabled play again button (tag = 20)
        let button = self.view.viewWithTag(20) as? UIButton
        if let button = button {
            button.isEnabled = true
        }
        
    }
    
    func machinePlay(){
        // 1. get an array of unused squares
        var unusedSquaresDict = gameStatus // copy the original dictionary
        unusedSquaresDict.forEach { if $1 != "" { unusedSquaresDict[$0] = nil } }  // filter out values that do not match
        var unusedSquaresInts: [Int] = Array(unusedSquaresDict.keys)
        unusedSquaresInts.sort()
        
        // get random unused square
        let openKeyCount = unusedSquaresInts.count
        if openKeyCount > 0 {
            var randomSquareSlot:UInt32 = arc4random_uniform(UInt32(openKeyCount-1))
            randomSquareSlot = randomSquareSlot + 1
            // squares are 1-9 so must increment as ranodm numbers start at 0
            let randomSquareSlotInt = Int(randomSquareSlot);
            let randomSquare = unusedSquaresInts[randomSquareSlotInt]
            print("randomSquare:  \(randomSquare)")
        
            // set the randomSquare in the dict and display
            gameStatus[randomSquare] = "o"
            let randomSquareInt = Int(randomSquare)
            let button = self.view.viewWithTag(randomSquareInt) as? UIButton
            if let button = button {
                button.setTitle("o", for: UIControlState.normal)
                button.isEnabled = false
            }
        }
        if findWinner() {
            gameOver()
        }
    }
    
    func setTextColor(winSquares squareTags:[Int], color newColor:UIColor){
        // change the button color to indicate the win
        for squareTag in squareTags {
            let button = self.view.viewWithTag(squareTag) as? UIButton
            //let winColor = UIColor.newColor
            if let button = button {
                button.setTitleColor(newColor, for: UIControlState.normal)
            }
        }
    }

    
    func findWinner() -> Bool {
        var xStatus = gameStatus // copy the original dictionary
        xStatus.forEach { if $1 != "x" { xStatus[$0] = nil } }  // filter out values that do not match
        var xStatusKeys = Array(xStatus.keys)
        xStatusKeys.sort();
        
        var oStatus = gameStatus // copy the original dictionary
        oStatus.forEach { if $1 != "o" { oStatus[$0] = nil } }  // filter out values that do not match
        var oStatusKeys = Array(oStatus.keys)
        oStatusKeys.sort();
        
        // need an array of all keys used to determine if the game is a cat
        var oxStatusKeys: [Int]  = []
        oxStatusKeys = xStatusKeys + oStatusKeys
        
        var stopPlay = false
        
        print("xStatusKeys: \(xStatusKeys)")
        print("oStatusKeys: \(oStatusKeys)")

        let winLabel = self.view.viewWithTag(10) as? UILabel
        
        let appWins = "Game Over, The App wins!"
        let userWins = "Game Over, You win!"
        let noWinner = "Cat, play again!"
        let winColor = UIColor.red
        
        if xStatusKeys.contains(1) && xStatusKeys.contains(2) && xStatusKeys.contains(3) {
            winLabel?.text = userWins
            setTextColor(winSquares: [1,2,3], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(4) && xStatusKeys.contains(5) && xStatusKeys.contains(6) {
            winLabel?.text = userWins
            setTextColor(winSquares: [4,5,6], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(7) && xStatusKeys.contains(8) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            setTextColor(winSquares: [7,8,9], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(3) && xStatusKeys.contains(5) && xStatusKeys.contains(7) {
            winLabel?.text = userWins
            setTextColor(winSquares: [3,5,7], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(1) && xStatusKeys.contains(5) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            setTextColor(winSquares: [1,5,9], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(1) && xStatusKeys.contains(4) && xStatusKeys.contains(7) {
            winLabel?.text = userWins
            setTextColor(winSquares: [1,4,7], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(2) && xStatusKeys.contains(5) && xStatusKeys.contains(8) {
            winLabel?.text = userWins
            setTextColor(winSquares: [2,5,8], color: winColor)
            stopPlay = true
        } else if xStatusKeys.contains(3) && xStatusKeys.contains(6) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            setTextColor(winSquares: [3,6,9], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(2) && oStatusKeys.contains(3) {
            winLabel?.text = appWins
            setTextColor(winSquares: [1,2,3], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(4) && oStatusKeys.contains(5) && oStatusKeys.contains(6) {
            winLabel?.text = appWins
            setTextColor(winSquares: [4,5,6], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(7) && oStatusKeys.contains(8) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            setTextColor(winSquares: [7,8,9], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(3) && oStatusKeys.contains(5) && oStatusKeys.contains(7) {
            winLabel?.text = appWins
            setTextColor(winSquares: [3,5,7], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(5) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            setTextColor(winSquares: [1,5,7], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(4) && oStatusKeys.contains(7) {
            winLabel?.text = appWins
            setTextColor(winSquares: [1,4,7], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(2) && oStatusKeys.contains(5) && oStatusKeys.contains(8) {
            winLabel?.text = appWins
            setTextColor(winSquares: [2,5,8], color: winColor)
            stopPlay = true
        } else if oStatusKeys.contains(3) && oStatusKeys.contains(6) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            setTextColor(winSquares: [3,6,9], color: winColor)
            stopPlay = true
        } else if oxStatusKeys.contains(1) && oxStatusKeys.contains(2) && oxStatusKeys.contains(3) && oxStatusKeys.contains(4) && oxStatusKeys.contains(5) && oxStatusKeys.contains(6) && oxStatusKeys.contains(7) && oxStatusKeys.contains(8) && oxStatusKeys.contains(9){
            winLabel?.text = noWinner
            stopPlay = true
        } else {
            winLabel?.text = "Keep playing"
        }
        return stopPlay
    }
}

