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
    func rotate90Degree(with selectedSide: Array<Array<String>>) -> Array<Array<String>> {
        // rotating the selected side 90 degree clockwise
        var resultArray: Array<Array<String>> = [["","",""],["","",""],["","",""]]
        let temp = selectedSide[0]
        resultArray[0][1] = selectedSide[1][0]
        resultArray[0][0] = selectedSide[2][0]
        resultArray[1][0] = selectedSide[2][1]
        resultArray[2][0] = selectedSide[2][2]
        resultArray[2][1] = selectedSide[1][2]
        resultArray[1][1] = selectedSide[1][1]
        for row in 0...2 {
            resultArray[row][2] = temp[row]
        }
        return resultArray
    }
    func rotateMinus90Degree(with selectedSide: Array<Array<String>>) -> Array<Array<String>> {
        // rotating the selected side 90 degree anti-clockwise
        var resultArray: Array<Array<String>> = [["","",""],["","",""],["","",""]]
        let temp = selectedSide[0]
        resultArray[0][1] = selectedSide[1][2]
        resultArray[0][2] = selectedSide[2][2]
        resultArray[1][2] = selectedSide[2][1]
        resultArray[2][2] = selectedSide[2][0]
        resultArray[2][1] = selectedSide[1][0]
        resultArray[1][1] = selectedSide[1][1]
        for row in 0...2 {
            print(row)
            resultArray[row][0] = temp.reversed()[row]
        }
        return resultArray
    }
    
    mutating func manipulateCube(instruction: String) {
        switch instruction {
        case "U": do {
            upperSide = rotate90Degree(with: upperSide)
            // manipulating surrounding sides
            let temp2 = frontSide[0]
            frontSide[0] = rightSide[0]
            rightSide[0] = backSide[0]
            backSide[0] = leftSide[0]
            leftSide[0] = temp2
        }
        case "U'": do {
            upperSide = rotateMinus90Degree(with: upperSide)
        }
        default: return
        }
    }
    
    mutating func handleInstruction(with userInput: String) {
        let inputArray: Array<String> = userInput.map { (char) -> String in
            String(char)
        }
        let lastIndexofInputArray = inputArray.count - 1
        for (index, value) in inputArray.enumerated() {
            var validValue: String = ""
            if inputArray[index] == "'" {
                continue
            } else if index != lastIndexofInputArray && inputArray[index + 1] == "'" {
                    validValue = "\(value)'"
                    manipulateCube(instruction: String(validValue))
                    print(validValue)
                    cubeOut()
                
            } else {
                validValue = "\(value)"
                manipulateCube(instruction: String(validValue))
                print(validValue)
                cubeOut()
            }
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
