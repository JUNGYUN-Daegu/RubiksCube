//
//  step3-RubiksCube.swift
//  RubiksCube
//
//  Created by 조중윤 on 2020/12/12.
//

import Foundation

//MARK:- STEP 3: RUBIK'S CUBE
struct RubiksCube {
    var upperSide: Array<Array<String>> = [["a","b","c"], ["h","B","d"],["g","f","e"]]
    var frontSide: Array<Array<String>> = [["W","W","W"], ["W","W","W"],["W","W","W"]]
    var rightSide: Array<Array<String>> = [["O","O","O"], ["O","O","O"],["O","O","O"]]
    var backSide: Array<Array<String>> = [["G","G","G"], ["G","G","G"],["G","G","G"]]
    var leftSide: Array<Array<String>> = [["Y","Y","Y"], ["Y","Y","Y"],["Y","Y","Y"]]
    var bottomSide: Array<Array<String>> = [["R","R","R"], ["R","R","R"],["R","R","R"]]
    
    func cubeOut() {
        let padding: String = "     "
        for row in upperSide {
            print("\(padding)\(padding)\(padding)\(row.joined(separator: " "))")
        }
        print()
        for rowNumber in 0...2 {
            print("\(frontSide[rowNumber].joined(separator: " "))\(padding)" +
                "\(rightSide[rowNumber].joined(separator: " "))\(padding)" +
                "\(backSide[rowNumber].joined(separator: " "))\(padding)" +
                "\(leftSide[rowNumber].joined(separator: " "))")
        }
        print()
        for row in bottomSide {
            print("\(padding)\(padding)\(padding)\(row.joined(separator: " "))")
        }
    }
   
    mutating func manipulateCube(instruction: String) {
        switch instruction {
        case "U": do {
            // rotating the selected side 90 degree clockwise
            let temp = upperSide[0]
            upperSide[0][1] = upperSide[1][0]
            upperSide[0][0] = upperSide[2][0]
            upperSide[1][0] = upperSide[2][1]
            upperSide[2][0] = upperSide[2][2]
            upperSide[2][1] = upperSide[1][2]
            for row in 0...2 {
                upperSide[row][2] = temp[row]
            }
            // manipulating surrounding sides
            let temp2 = frontSide[0]
            frontSide[0] = rightSide[0]
            rightSide[0] = backSide[0]
            backSide[0] = leftSide[0]
            leftSide[0] = temp2
        }
        case "U'": do {
            // rotating the selected side 90 degree anti-clockwise
        }
        default: return
        }
    }
    
    mutating func handleInstruction(with userInput: String) {
        for letter in userInput {
                print(letter)
                cubeManipulation(instruction: String(letter))
                cubeOut()
        }
    }
    
    mutating func gameIteration() {
        repeat{
            print("CUBE>", terminator: " ")
            guard let userInput = readLine() else {
                print("user input not found")
                return
            }
            if userInput == "Q" {
                print("Bye~")
                break
            } else {
                handleInstruction(with: userInput)
            }
        } while true
    }
}
