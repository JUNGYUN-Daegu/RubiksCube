//
//  step2-twoDimensionalCube.swift
//  RubiksCube
//
//  Created by 조중윤 on 2020/12/10.
//

import Foundation

//MARK:- STEP 2: TWO DIMENSIONAL CUBE
struct TwoDimensionalCube {
    var cube: Array<Array<String>> = [["R", "R", "W"], ["G","C","W"], ["G","B","B"]]
    
    mutating func manipulateCube(with input: String) {
        switch input {
        case "U": do {
            let temp = cube[0].removeFirst()
            cube[0].append(temp)
        }
        case "U'": do {
            let temp = cube[0].removeLast()
            cube[0].insert(temp, at: 0)
        }
        case "R": do{
            let temp = cube[0][2]
            cube[0][2] = cube[1][2]
            cube[1][2] = cube[2][2]
            cube[2][2] = temp
        }
        case "R'": do{
            let temp = cube[2][2]
            cube[2][2] = cube[1][2]
            cube[1][2] = cube[0][2]
            cube[0][2] = temp
        }
        case "L": do{
            let temp = cube[2][0]
            cube[2][0] = cube[1][0]
            cube[1][0] = cube[0][0]
            cube[0][0] = temp
        }
        case "L'": do{
            let temp = cube[0][0]
            cube[0][0] = cube[1][0]
            cube[1][0] = cube[2][0]
            cube[2][0] = temp
        }
        case "B": do{
            let temp = cube[2].removeLast()
            cube[2].insert(temp, at: 0)
        }
        case "B'": do{
            let temp = cube[2].removeFirst()
            cube[2].append(temp)
        }
        default: print("유효한 큐브 동작을 입력하세요")
        }
    }
    
    func cubeOut() {
        var result: String = ""
        for i in 0..<cube.count {
            for j in 0..<cube[i].count {
                result = "\(result) \(cube[i][j])"
            }
            result = "\(result)\n"
        }
        print(result)
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
