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
                cubeOut()
            }
        } while true
    }
    
}
