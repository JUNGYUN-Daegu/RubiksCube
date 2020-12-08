//
//  main.swift
//  RubiksCube
//
//  Created by 조중윤 on 2020/12/07.
//

import Foundation

//MARK:- STEP 1: LETTER THRUST
func receiveUserInput() {
    print("단어, 이동 횟수(-100이상 100 미만), 방향 좌우('L' 이나 'R', 대소문자 무상관)를 입력하세요")
    
    if let userInput = readLine() {
        guard userInput.split(separator: " ").count == 3 else {
            print("유효한 값을 입력해 주세요")
            return
        }
        var userWord = String(userInput.split(separator: " ")[0])
        guard let velocity = Int(userInput.split(separator: " ")[1]) else {
            print("유효한 이동 횟수를 입력해주세요")
            return
        }
        guard userInput.split(separator: " ")[2].uppercased() == "R" || userInput.split(separator: " ")[2].uppercased() == "L" else {
            print("유효한 방향을 입력해주세요")
            return
        }
        var direction: String {
            if userInput.split(separator: " ")[2].uppercased() == "R" && velocity >= 0 {
                return "R"
            } else if userInput.split(separator: " ")[2].uppercased() == "R" && velocity < 0 {
                return "L"
            } else if userInput.split(separator: " ")[2].uppercased() == "L" && velocity >= 0 {
                return "L"
            } else {
                return "R"
            }
        }
        
        if direction == "R" {
            if abs(velocity) % userWord.count > 0 {
                for _ in 0..<(abs(velocity) % userWord.count) {
                    var resultString: String = ""
                    let temp = userWord.popLast()!
                    resultString.append(temp)
                    resultString.append(contentsOf: userWord)
                    userWord = resultString
                }
                print (userWord)
            } else {
                print(userWord)
            }
            // when direction is "L"
        } else {
            if abs(velocity) % userWord.count > 0 {
                for _ in 0..<(abs(velocity) % userWord.count) {
                    var resultString: String = ""
                    let temp = userWord.removeFirst()
                    resultString.append(userWord)
                    resultString.append(temp)
                    userWord = resultString
                }
                print (userWord)
            } else {
                print(userWord)
            }
        }
    }
}

receiveUserInput()
