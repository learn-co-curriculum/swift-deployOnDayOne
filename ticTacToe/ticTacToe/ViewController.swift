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
        let winLabel = self.view.viewWithTag(10) as? UILabel
        winLabel?.text = "Start Playing"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchedSquare(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("touched 1")
            onClickSquare(tagName:1, button: sender);
        case 2:
            print("touched 2")
            onClickSquare(tagName:2, button: sender);
        case 3:
            print("touched 3")
            onClickSquare(tagName:3, button: sender);
        case 4:
            print("touched 4")
            onClickSquare(tagName:4, button: sender);
        case 5:
            print("touched 5")
            onClickSquare(tagName:5, button: sender);
        case 6:
            print("touched 6")
            onClickSquare(tagName:6, button: sender);
        case 7:
            print("touched 7")
            onClickSquare(tagName:7, button: sender);
        case 8:
            print("touched 8")
            onClickSquare(tagName:8, button: sender);
        case 9:
            print("touched 9")
            onClickSquare(tagName:9, button: sender);
        default:
            print("default")
            
        }
    }
    
    var gameStatus: [Int: String] = [1:"",2:"", 3:"", 4:"", 5:"", 6:"", 7:"", 8:"", 9:""]
    
    func onClickSquare (tagName: Int, button: UIButton) {
        
        button.setTitle("x", for: UIControlState.normal)
        button.isEnabled = false
        gameStatus[tagName] = "x"
        
        print("game status before machine play: ")
        print(gameStatus)
        
        let machinePlayResults = machinePlay()
        print("machinePlayResults: \(machinePlayResults)")
        findWinner()
        
        print("game status after machine play: ")
        print(gameStatus)

    }
    
    func gameOver(){
        // 1. get an array of unused squares
        var unusedSquaresDict = gameStatus // copy the original dictionary
        unusedSquaresDict.forEach { if $1 != "" { unusedSquaresDict[$0] = nil } }  // filter out values that do not match
        let unusedSquaresInts: [Int] = Array(unusedSquaresDict.keys)
        for unusedSquare in unusedSquaresInts {
            let button = self.view.viewWithTag(unusedSquare) as? UIButton
            button?.isEnabled = false
        }
    }
    
    func machinePlay() -> Bool {
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
            button?.setTitle("o", for: UIControlState.normal)
            button?.isEnabled = false
        
            return true
        } else {
            return false
        }
    }
    
    func findWinner(){
        var xStatus = gameStatus // copy the original dictionary
        xStatus.forEach { if $1 != "x" { xStatus[$0] = nil } }  // filter out values that do not match
        var xStatusKeys = Array(xStatus.keys)
        xStatusKeys.sort();
        
        var oStatus = gameStatus // copy the original dictionary
        oStatus.forEach { if $1 != "o" { oStatus[$0] = nil } }  // filter out values that do not match
        var oStatusKeys = Array(oStatus.keys)
        oStatusKeys.sort();
        
        print("xStatusKeys: ")
        print(xStatusKeys)
        
        print("oStatusKeys: ")
        print(oStatusKeys)
        
        let winLabel = self.view.viewWithTag(10) as? UILabel
        
        let appWins = "Game Over, The App wins!"
        let userWins = "Game Over, You win!"
        
        if xStatusKeys.contains(1) && xStatusKeys.contains(2) && xStatusKeys.contains(3) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(4) && xStatusKeys.contains(5) && xStatusKeys.contains(6) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(7) && xStatusKeys.contains(8) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(3) && xStatusKeys.contains(5) && xStatusKeys.contains(7) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(1) && xStatusKeys.contains(5) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(1) && xStatusKeys.contains(4) && xStatusKeys.contains(7) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(2) && xStatusKeys.contains(5) && xStatusKeys.contains(8) {
            winLabel?.text = userWins
            gameOver()
        } else if xStatusKeys.contains(3) && xStatusKeys.contains(6) && xStatusKeys.contains(9) {
            winLabel?.text = userWins
            gameOver()
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(2) && oStatusKeys.contains(3) {
            winLabel?.text = userWins
            gameOver()
        } else if oStatusKeys.contains(4) && oStatusKeys.contains(5) && oStatusKeys.contains(6) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(7) && oStatusKeys.contains(8) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(3) && oStatusKeys.contains(5) && oStatusKeys.contains(7) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(5) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(1) && oStatusKeys.contains(4) && oStatusKeys.contains(7) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(2) && oStatusKeys.contains(5) && oStatusKeys.contains(8) {
            winLabel?.text = appWins
            gameOver()
        } else if oStatusKeys.contains(3) && oStatusKeys.contains(6) && oStatusKeys.contains(9) {
            winLabel?.text = appWins
            gameOver()
        } else {
            winLabel?.text = "Keep playing"
        }
        
    }
}

