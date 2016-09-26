var ticTacToe = ["O","","O","","","","","",""]


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
    
    return -1
}
computerShouldPlay()