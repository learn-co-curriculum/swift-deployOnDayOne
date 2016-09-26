//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonOne: UIButton = UIButton()
    let buttonTwo: UIButton = UIButton()
    let buttonThree: UIButton = UIButton()
    let buttonFour: UIButton = UIButton()
    let buttonFive: UIButton = UIButton()
    let buttonSix: UIButton = UIButton()
    let buttonSeven: UIButton = UIButton()
    let buttonEight: UIButton = UIButton()
    let buttonNine: UIButton = UIButton()

    let endScreen: UIView = UIView()
    let endLabel: UILabel = UILabel()
    
    let boardOne = UIView()
    let boardTwo = UIView()
    let boardThree = UIView()
    let boardFour = UIView()

     var ticTacToe: [String] = ["", "", "", "", "", "", "", "", ""]
   
    let victoryConditions: [[Int]] = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    var isPlaying: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadButtons()
        loadBoard()
        loadEndScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadEndScreen() {
        let viewSize = self.view.frame.size
        
        endScreen.frame = CGRect(x: viewSize.width*0.1, y: viewSize.height, width: viewSize.width*0.8, height: viewSize.width*0.6)
        endScreen.backgroundColor = UIColor.yellow
        
        let button = UIButton()
        button.frame = CGRect(x: endScreen.frame.size.width*0.2, y: endScreen.frame.size.height*0.6, width: endScreen.frame.size.width*0.6, height: endScreen.frame.size.height*0.3)
        button.backgroundColor = UIColor.cyan
        button.setTitle("Replay", for: .normal)
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        
        endScreen.addSubview(button)
        
        endLabel.frame = CGRect(x: endScreen.frame.size.width*0.1, y: endScreen.frame.size.height*0.1, width: endScreen.frame.size.width*0.8, height: endScreen.frame.size.height*0.5)
        endLabel.textAlignment = .center
        endScreen.addSubview(endLabel)
        self.view.addSubview(endScreen)
        
        
    }
    
    func loadButtons() {
        let viewSize = self.view.frame.size
        
        buttonOne.frame = CGRect(x: viewSize.width*0.1, y: viewSize.width*0.2, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonOne.backgroundColor = UIColor.cyan
        buttonOne.tag = 0
        buttonOne.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)
        self.view.addSubview(buttonOne)
        
        buttonTwo.frame = CGRect(x: viewSize.width*0.4, y: viewSize.width*0.2, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonTwo.backgroundColor = UIColor.cyan
        buttonTwo.tag = 1
        buttonTwo.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)
        self.view.addSubview(buttonTwo)

        buttonThree.frame = CGRect(x: viewSize.width*0.7, y: viewSize.width*0.2, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonThree.backgroundColor = UIColor.cyan
        buttonThree.tag = 2
        buttonThree.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonThree)

        buttonFour.frame = CGRect(x: viewSize.width*0.1, y: viewSize.width*0.5, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonFour.backgroundColor = UIColor.cyan
        buttonFour.tag = 3
        buttonFour.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonFour)

        buttonFive.frame = CGRect(x: viewSize.width*0.4, y: viewSize.width*0.5, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonFive.backgroundColor = UIColor.cyan
        buttonFive.tag = 4
        buttonFive.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonFive)

        buttonSix.frame = CGRect(x: viewSize.width*0.7, y: viewSize.width*0.5, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonSix.backgroundColor = UIColor.cyan
        buttonSix.tag = 5
        buttonSix.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonSix)

        buttonSeven.frame = CGRect(x: viewSize.width*0.1, y: viewSize.width*0.8, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonSeven.backgroundColor = UIColor.cyan
        buttonSeven.tag = 6
        buttonSeven.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonSeven)

        buttonEight.frame = CGRect(x: viewSize.width*0.4, y: viewSize.width*0.8, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonEight.backgroundColor = UIColor.cyan
        buttonEight.tag = 7
        buttonEight.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonEight)

        buttonNine.frame = CGRect(x: viewSize.width*0.7, y: viewSize.width*0.8, width: viewSize.width*0.20, height: viewSize.width*0.20)
        buttonNine.backgroundColor = UIColor.cyan
        buttonNine.tag = 8
        buttonNine.addTarget(self, action: #selector(clickMeBaby), for: .touchUpInside)

        self.view.addSubview(buttonNine)

        
        
    }
    
    func loadBoard() {
        let viewSize = self.view.frame.size
        
        boardOne.frame = CGRect(x: viewSize.width*0.3, y: viewSize.width*0.2, width: viewSize.width*0.1, height: viewSize.width*0.8)
        boardOne.backgroundColor = UIColor.blue
        self.view.addSubview(boardOne)
        
        boardTwo.frame = CGRect(x: viewSize.width*0.6, y: viewSize.width*0.2, width: viewSize.width*0.1, height: viewSize.width*0.8)
        boardTwo.backgroundColor = UIColor.blue
        self.view.addSubview(boardTwo)

        boardThree.frame = CGRect(x: viewSize.width*0.1, y: viewSize.width*0.4, width: viewSize.width*0.8, height: viewSize.width*0.1)
        boardThree.backgroundColor = UIColor.blue
        self.view.addSubview(boardThree)

        boardFour.frame = CGRect(x: viewSize.width*0.1, y: viewSize.width*0.7, width: viewSize.width*0.8, height: viewSize.width*0.1)
        boardFour.backgroundColor = UIColor.blue
        self.view.addSubview(boardFour)

    }
    
    func clickMeBaby(sender: UIButton) {
        if isPlaying {
            if ticTacToe[sender.tag] == "" {
                ticTacToe[sender.tag] = "X"
                if isWinner(symbol: "X") {
                    isPlaying = false
                    endLabel.text = "You Win"
                    UIView.animate(withDuration: 0.3, animations: {
                        self.endScreen.frame.origin.y -= self.view.frame.height*0.4
                    })
                    
                }
                computersTurn()
                updateTitles()
                if isWinner(symbol: "O") {
                    isPlaying = false
                    endLabel.text = "You Lose"
                    UIView.animate(withDuration: 0.3, animations: {
                        self.endScreen.frame.origin.y -= self.view.frame.height*0.4
                    })
                    
                }
            }
        }
    }
    
    func testForBlock(row: [String]) -> Bool {
        if row.sorted() == ["","X","X"] {
            return true
        } else {
            return false
        }
    }
    
    func computersTurn() {
        if ticTacToe.contains("") {
            ticTacToe[computerShouldPlay()] = "O"
        } else {
            endLabel.text = "Draw!"
            UIView.animate(withDuration: 0.3, animations: {
                self.endScreen.frame.origin.y -= self.view.frame.height*0.4
            })
            
        }
    }
    
    
    func startNewGame() {
        isPlaying = true
        ticTacToe = ["","","","","","","","",""]
        updateTitles()
        UIView.animate(withDuration: 0.3, animations: {
            self.endScreen.frame.origin.y += self.view.frame.height*0.4
        })
    }
    
    func isWinner(symbol: String) -> Bool {
        if ticTacToe[0] == symbol && ticTacToe[1] == symbol && ticTacToe[2] == symbol {
            return true
        } else if ticTacToe[3] == symbol && ticTacToe[4] == symbol && ticTacToe[5] == symbol {
            return true
        } else if ticTacToe[6] == symbol && ticTacToe[7] == symbol && ticTacToe[8] == symbol {
            return true
        } else  if ticTacToe[0] == symbol && ticTacToe[3] == symbol && ticTacToe[6] == symbol {
            return true
        } else if ticTacToe[1] == symbol && ticTacToe[4] == symbol && ticTacToe[7] == symbol {
            return true
        } else if ticTacToe[2] == symbol && ticTacToe[5] == symbol && ticTacToe[8] == symbol {
            return true
        }else if ticTacToe[0] == symbol && ticTacToe[4] == symbol && ticTacToe[8] == symbol {
            return true
        } else if ticTacToe[2] == symbol && ticTacToe[4] == symbol && ticTacToe[6] == symbol {
            return true
        } else {
            return false
        }
    }
    
    func updateTitles() {
        buttonOne.setTitle((ticTacToe[0]), for: .normal)
        buttonTwo.setTitle((ticTacToe[1]), for: .normal)
        buttonThree.setTitle((ticTacToe[2]), for: .normal)
        buttonFour.setTitle((ticTacToe[3]), for: .normal)

        buttonFive.setTitle((ticTacToe[4]), for: .normal)
        buttonSix.setTitle((ticTacToe[5]), for: .normal)
        buttonSeven.setTitle((ticTacToe[6]), for: .normal)
        buttonEight.setTitle((ticTacToe[7]), for: .normal)
        buttonNine.setTitle((ticTacToe[8]), for: .normal)

    }
 
    func testForWin (victoryCondition:[Int])-> Bool {
        var temp: [String] = []
        
        for index in victoryCondition {
            temp.append(ticTacToe[index])
        }
        if temp.sorted() == ["","O","O"] {
            return true
        } else {
            return false
        }
    }
    func testForBlock (victoryCondition:[Int])-> Bool {
        var temp: [String] = []
        
        for index in victoryCondition {
            temp.append(ticTacToe[index])
        }
        if temp.sorted() == ["","X","X"] {
            return true
        } else {
            return false
        }
    }
    
    func computerShouldPlay ()->Int {
        if isPlaying {
            //If the computer can win they should
            for condition in victoryConditions {
                let shouldWin = testForWin(victoryCondition: condition)
                if shouldWin {
                    for box in condition {
                        if ticTacToe[box] == "" {
                            return box
                        }
                    }
                }
            }
            
            //If the play can win the computer should stop them
            for condition in victoryConditions {
                let shouldBlock = testForBlock(victoryCondition: condition)
                if shouldBlock {
                    for box in condition {
                        if ticTacToe[box] == "" {
                            return box
                        }
                    }
                }
            }
            //If the center is open the computer should take it
            if ticTacToe[4] == "" {
                return 4
            } else if ticTacToe[0] == "" {
                return 0
            } else if ticTacToe[2] == "" {
                return 2
            } else if ticTacToe[6] == "" {
                return 6
            } else if ticTacToe[8] == "" {
                return 8
            }
        }
         return -1
    }
}

