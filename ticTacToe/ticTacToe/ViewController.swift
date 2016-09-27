//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleCard: UILabel!
    
    @IBOutlet weak var playerLabel: UILabel!

    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var buttonFour: UIButton!
    
    @IBOutlet weak var buttonFive: UIButton!
    
    @IBOutlet weak var buttonSix: UIButton!
    
    @IBOutlet weak var buttonSeven: UIButton!
    
    @IBOutlet weak var buttonEight: UIButton!
    
    @IBOutlet weak var buttonNine: UIButton!
    
    @IBOutlet weak var buttonLabelOne: UILabel!
    
    @IBOutlet weak var buttonLabelTwo: UILabel!
    
    @IBOutlet weak var buttonLabelThree: UILabel!
    
    @IBOutlet weak var buttonLabelFour: UILabel!
    
    @IBOutlet weak var buttonLabelFive: UILabel!
    
    @IBOutlet weak var buttonLabelSix: UILabel!
    
    @IBOutlet weak var buttonLabelSeven: UILabel!
    
    @IBOutlet weak var buttonLabelEight: UILabel!
    
    @IBOutlet weak var buttonLabelNine: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var resetLabel: UIButton!
    
    @IBOutlet weak var reset: UILabel!
    
    @IBAction func buttonClicked(sender: UIButton) {
       // let whichButton = sender
        //print("\(whichButton) is sender")
        var buttonNumber = ""
        if isPlayerOne == true {
            let clickValue = "O"
           // print("\(whichButton) is sender")
            if let buttonText = sender.titleLabel?.text {
                print(buttonText)
                
                setButtonValue(buttonText: buttonText)
            }
        }   else {
            let clickValue = "X"
          //  print("\(whichButton) is sender")
            if let buttonText = sender.titleLabel?.text {
                print(buttonText)
                setButtonValue(buttonText: buttonText)
            }
        }
    }
    
    @IBAction func resetClicked(sender: UIButton) {
        buttonOneValue = ""
        buttonTwoValue = ""
        buttonThreeValue = ""
        buttonFourValue = ""
        buttonFiveValue = ""
        buttonSixValue = ""
        buttonSevenValue = ""
        buttonEightValue  = ""
        buttonNineValue =  ""
        
        buttonLabelOne.isHidden = true
        buttonLabelTwo.isHidden = true
        buttonLabelThree.isHidden = true
        buttonLabelFour.isHidden = true
        buttonLabelFive.isHidden = true
        buttonLabelSix.isHidden = true
        buttonLabelSeven.isHidden = true
        buttonLabelEight.isHidden = true
        buttonLabelNine.isHidden = true
        
        buttonOne.isUserInteractionEnabled = true
        buttonTwo.isUserInteractionEnabled = true
        buttonThree.isUserInteractionEnabled = true
        buttonFour.isUserInteractionEnabled = true
        buttonFive.isUserInteractionEnabled = true
        buttonSix.isUserInteractionEnabled = true
        buttonSeven.isUserInteractionEnabled = true
        buttonEight.isUserInteractionEnabled = true
        buttonNine.isUserInteractionEnabled = true
        
        winLabel.isHidden = true
        playerLabel.text = "Player 1's Turn"
        playerLabel.isHidden = false
        reset.isHidden = true
    }
    
    func setButtonValue(buttonText: String) {
        switch buttonText {
            
        case "ButtonOne":
            buttonOneValue = whichPlayer()
            buttonLabelOne.text = buttonOneValue
            //buttonOne.isHidden = false
            //Unhide button
            //Function for checking for 3 in a row
            let clickValue = buttonOneValue
            print("The click value is \(clickValue)")
            switchPlayer()
            print(isPlayerOne)
            print("\(buttonOneValue) is buttonValue")
            buttonLabelOne.isHidden = false
            buttonOne.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
        case "ButtonTwo":
            buttonTwoValue = whichPlayer()
            buttonLabelTwo.text = buttonTwoValue
            let clickValue = buttonTwoValue
            switchPlayer()
            print(isPlayerOne)
            print("\(buttonTwoValue) is buttonValue")
            buttonLabelTwo.isHidden = false
            buttonTwo.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
        case "ButtonThree":
            buttonThreeValue = whichPlayer()
            buttonLabelThree.text = buttonThreeValue
            let clickValue = buttonThreeValue
            switchPlayer()
            print(isPlayerOne)

            buttonLabelThree.isHidden = false
            buttonThree.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            case "ButtonFour":
            buttonFourValue = whichPlayer()
            buttonLabelFour.text = buttonFourValue
            let clickValue = buttonFourValue
            switchPlayer()
            print(isPlayerOne)
            
            buttonLabelFour.isHidden = false
            buttonFour.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            case "ButtonFive":
            buttonFiveValue = whichPlayer()
            buttonLabelFive.text = buttonFiveValue
            let clickValue = buttonFiveValue
            switchPlayer()
            print(isPlayerOne)
            buttonLabelFive.isHidden = false
            buttonFive.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            case "ButtonSix":
            buttonSixValue = whichPlayer()
            buttonLabelSix.text = buttonSixValue
            let clickValue = buttonSixValue
            switchPlayer()
            print(isPlayerOne)
            buttonLabelSix.isHidden = false
            buttonSix.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            case "ButtonSeven":
            buttonSevenValue = whichPlayer()
            buttonLabelSeven.text = buttonSevenValue
            let clickValue = buttonSevenValue
            switchPlayer()
            print(isPlayerOne)
            buttonLabelSeven.isHidden = false
            buttonSeven.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            
            case "ButtonEight":
            buttonEightValue = whichPlayer()
            buttonLabelEight.text = buttonEightValue
            let clickValue = buttonEightValue
            switchPlayer()
            print(isPlayerOne)
            buttonLabelEight.isHidden = false
            buttonEight.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            case "ButtonNine":
            buttonNineValue = whichPlayer()
            buttonLabelNine.text = buttonNineValue
            let clickValue = buttonNineValue
            switchPlayer()
            print(isPlayerOne)
            buttonLabelNine.isHidden = false
            buttonNine.isUserInteractionEnabled = false
            checkForWin(clickValue: clickValue)
            
            flipPlayerLabel()
            
            
        default:
            print("Default")
        }
    }
    
    func whichPlayer() -> String {
        if isPlayerOne == true {
            return "O"
        }   else {
            return "X"
        }
    }
    
    func flipPlayerLabel() {
        if isPlayerOne == true {
            playerLabel.text = "Player 1's Turn"
        }   else {
            playerLabel.text = "Player 2's Turn"
        }
    }
    
    func switchPlayer() {
        if isPlayerOne == true {
            isPlayerOne = false
        }   else {
            isPlayerOne = true
        }
    }
    
    func checkForWin(clickValue: String)  {
    if  (buttonOneValue == clickValue) && (buttonTwoValue == clickValue) && (buttonThreeValue == clickValue) {
        print("You Won!")
        winningActions(clickValue: clickValue)
   // winningActions(clickValue: clickValue)
    }
    
    else if (buttonFourValue == clickValue) && (buttonFiveValue == clickValue) && (buttonSixValue == clickValue) {
   // winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if (buttonSevenValue == clickValue) && (buttonEightValue == clickValue) && (buttonNineValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if (buttonOneValue == clickValue) && (buttonFourValue == clickValue) && (buttonSevenValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if (buttonTwoValue == clickValue) && (buttonFiveValue == clickValue) && (buttonEightValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if  (buttonThreeValue == clickValue) && (buttonSixValue == clickValue) && (buttonNineValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if (buttonOneValue == clickValue) && (buttonFiveValue == clickValue) && (buttonNineValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    
    else if  (buttonThreeValue == clickValue) && (buttonFiveValue == clickValue) && (buttonSevenValue == clickValue) {
    //winningActions(clickValue: clickValue)
        print("You won!")
        winningActions(clickValue: clickValue)
    }
    else {
    print("next turn")
    }
    
    }
    
    func winningActions(clickValue: String) {
        if clickValue == "O" {
            winLabel.text = "Player 1 won!"
            winLabel.isHidden = false
            playerLabel.isHidden = true
            reset.isHidden = false
        } else {
            winLabel.text = "Player 2 won!"
            winLabel.isHidden = false
            playerLabel.isHidden = true
            reset.isHidden = false
        }
    }
    
    var buttonOneValue: String = ""
    var buttonTwoValue: String = ""
    var buttonThreeValue: String = ""
    var buttonFourValue: String = ""
    var buttonFiveValue: String = ""
    var buttonSixValue: String = ""
    var buttonSevenValue: String = ""
    var buttonEightValue: String = ""
    var buttonNineValue: String = ""
    
    var isPlayerOne = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonLabelOne.isHidden = true
        buttonLabelTwo.isHidden = true
        buttonLabelThree.isHidden = true
        buttonLabelFour.isHidden = true
        buttonLabelFive.isHidden = true
        buttonLabelSix.isHidden = true
        buttonLabelSeven.isHidden = true
        buttonLabelEight.isHidden = true
        buttonLabelNine.isHidden = true
        reset.isHidden = true
        winLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



