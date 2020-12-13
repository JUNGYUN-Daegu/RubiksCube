//
//  step3-RubiksCube.swift
//  RubiksCube
//
//  Created by 조중윤 on 2020/12/12.
//

import Foundation

//MARK:- STEP 3: RUBIK'S CUBE
struct RubiksCube {
    var upperSide: Array<Array<String>> = [["B","B","B"], ["B","B","B"],["B","B","B"]]
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
            resultArray[row][0] = temp.reversed()[row]
        }
        return resultArray
    }
    
    //U, U' Pressed
    mutating func firstRowRotation(with instruction: String) {
        // rotating -90 degree
        if instruction.contains("'") {
            let temp = frontSide[0]
            frontSide[0] = leftSide[0]
            leftSide[0] = backSide[0]
            backSide[0] = rightSide[0]
            rightSide[0] = temp
        // rotating 90 degree
        } else {
            let temp = frontSide[0]
            frontSide[0] = rightSide[0]
            rightSide[0] = backSide[0]
            backSide[0] = leftSide[0]
            leftSide[0] = temp
        }
    }
    //D, D' pressed
    mutating func lastRowRotation(with instruction: String) {
        // rotating -90 degree
        if instruction.contains("'") {
            let temp = frontSide[2]
            frontSide[2] = leftSide[2]
            leftSide[2] = backSide[2]
            backSide[2] = rightSide[2]
            rightSide[2] = temp
        // rotating 90 degree
        } else {
            let temp = frontSide[2]
            frontSide[2] = rightSide[2]
            rightSide[2] = backSide[2]
            backSide[2] = leftSide[2]
            leftSide[2] = temp
        }
    }
    func firstElementOfEachRow(inputArray: Array<Array<String>>) -> Array<String> {
        var temp: Array<String> {
            var tempArray: Array<String> = []
            for row in inputArray {
                tempArray.append(row[0])
            }
            return tempArray
        }
        print(temp)
        return temp
    }

    // L, L' pressed
    mutating func columnRotationWhenLPressed(with instruction: String) {
        let column_upperSide = firstElementOfEachRow(inputArray: upperSide)
        let column_backSide = firstElementOfEachRow(inputArray: backSide)
        let column_bottomSide = firstElementOfEachRow(inputArray: bottomSide)
        let column_frontSide = firstElementOfEachRow(inputArray: frontSide)
        
        if instruction.contains("'") {
            for row in 0...2 {
                upperSide[row][0] = column_frontSide[row]
                frontSide[row][0] = column_bottomSide[row]
                bottomSide[row][0] = column_backSide.reversed()[row]
                backSide[row][0] = column_upperSide.reversed()[row]
            }
        } else {
            for row in 0...2 {
                upperSide[row][0] = column_backSide.reversed()[row]
                backSide[row][0] = column_bottomSide.reversed()[row]
                bottomSide[row][0] = column_frontSide[row]
                frontSide[row][0] = column_upperSide[row]
            }
        }
    }
    func lastElementOfEachRow(inputArray: Array<Array<String>>) -> Array<String> {
        var temp: Array<String> {
            var tempArray: Array<String> = []
            for row in inputArray {
                tempArray.append(row[2])
            }
            return tempArray
        }
        print(temp)
        return temp
    }
    
    // R, R' pressed
    mutating func columnRotationWhenRPressed(with instruction: String) {
        let column_upperSide = lastElementOfEachRow(inputArray: upperSide)
        let column_backSide = lastElementOfEachRow(inputArray: backSide)
        let column_bottomSide = lastElementOfEachRow(inputArray: bottomSide)
        let column_frontSide = lastElementOfEachRow(inputArray: frontSide)
        
        if instruction.contains("'") {
            for row in 0...2 {
                upperSide[row][2] = column_backSide.reversed()[row]
                backSide[row][2] = column_bottomSide.reversed()[row]
                bottomSide[row][2] = column_frontSide[row]
                frontSide[row][2] = column_upperSide[row]
            }
        } else {
            for row in 0...2 {
                upperSide[row][2] = column_frontSide[row]
                frontSide[row][2] = column_bottomSide[row]
                bottomSide[row][2] = column_backSide.reversed()[row]
                backSide[row][2] = column_upperSide.reversed()[row]
            }
        }
    }
    
    // F, F' Pressed
    mutating func rotationWhenFPressed(with instruction: String) {
        let row_upperSide = upperSide[2]
        let column_rightSide = firstElementOfEachRow(inputArray: rightSide)
        let row_bottomSide = bottomSide[0]
        let column_leftSide = lastElementOfEachRow(inputArray: leftSide)
        
        if instruction.contains("'") {
            for row in 0...2 {
                upperSide[2] = column_rightSide
                rightSide[row][0] = row_bottomSide.reversed()[row]
                bottomSide[0] = column_leftSide
                leftSide[row][2] = row_upperSide.reversed()[row]
            }
        } else {
            for row in 0...2 {
                upperSide[2] = column_leftSide
                leftSide[row][2] = row_bottomSide[row]
                bottomSide[0] = column_rightSide.reversed()
                rightSide[row][0] = row_upperSide[row]
            }
        }
    }
    
    // B, B' pressed
    mutating func rotationWhenBPressed(with instruction: String) {
        let row_upperSide = upperSide[0]
        let column_rightSide = lastElementOfEachRow(inputArray: rightSide)
        let row_bottomSide = bottomSide[2]
        let column_leftSide = firstElementOfEachRow(inputArray: leftSide)
        
        if instruction.contains("'") {
            for row in 0...2 {
                upperSide[0] = column_leftSide.reversed()
                leftSide[row][0] = row_bottomSide[row]
                bottomSide[2] = column_rightSide.reversed()
                rightSide[row][2] = row_upperSide[row]
            }
        } else {
            for row in 0...2 {
                upperSide[0] = column_rightSide
                rightSide[row][2] = row_bottomSide.reversed()[row]
                bottomSide[2] = column_leftSide
                leftSide[row][0] = row_upperSide.reversed()[row]
            }
        }
    }
    
    mutating func manipulateCube(with instruction: String) {
        switch instruction {
        case "U": do {
            upperSide = rotate90Degree(with: upperSide)
            firstRowRotation(with: instruction)
        } case "U'": do {
            upperSide = rotateMinus90Degree(with: upperSide)
            firstRowRotation(with: instruction)
        } case "D": do {
            bottomSide = rotate90Degree(with: bottomSide)
            lastRowRotation(with: instruction)
        } case "D'": do {
            bottomSide = rotateMinus90Degree(with: bottomSide)
            lastRowRotation(with: instruction)
        } case "L": do {
            leftSide = rotate90Degree(with: leftSide)
            columnRotationWhenLPressed(with: instruction)
        } case "L'": do {
            leftSide = rotateMinus90Degree(with: leftSide)
            columnRotationWhenLPressed(with: instruction)
        } case "R": do {
            rightSide = rotate90Degree(with: rightSide)
            columnRotationWhenRPressed(with: instruction)
        } case "R'": do {
            rightSide = rotateMinus90Degree(with: rightSide)
            columnRotationWhenRPressed(with: instruction)
        } case "F": do {
            frontSide = rotate90Degree(with: frontSide)
            rotationWhenFPressed(with: instruction)
        } case "F'": do {
            frontSide = rotateMinus90Degree(with: frontSide)
            rotationWhenFPressed(with: instruction)
        } case "B": do {
            backSide = rotate90Degree(with: backSide)
            rotationWhenBPressed(with: instruction)
        } case "B'": do {
            backSide = rotateMinus90Degree(with: backSide)
            rotationWhenBPressed(with: instruction)
        } default: return
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
                    manipulateCube(with: String(validValue))
                    print(validValue)
                    cubeOut()
            } else {
                validValue = "\(value)"
                manipulateCube(with: String(validValue))
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
