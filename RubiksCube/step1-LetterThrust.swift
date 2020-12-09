//
//  step1-LetterThrust.swift
//  RubiksCube
//
//  Created by 조중윤 on 2020/12/09.
//

import Foundation

//MARK:- STEP 1: LETTER THRUST
func receiveUserInput() -> (String, Int, String)? {
    print("단어, 이동 횟수(-100이상 100미만), 좌우 방향('L' 이나 'R', 대소문자 무상관)울 입력하세요")
    var resultTuple: (userWord: String, userVelocity: Int, userDirection: String) = (userWord: "", userVelocity: 0, userDirection: "")
    
    if let userInput = readLine() {
        let inputArray = userInput.split(separator: " ")
        
        guard inputArray.count == 3 else {
            print("유효한 값의 형식('단어' '이동횟수' '방향')을 입력해 주세요")
            return nil
        }
        resultTuple.userWord = String(inputArray[0])
        
        guard let velocity = Int(inputArray[1]) else {
            print("유효한 이동 횟수를 입력해주세요")
            return nil
        }
        resultTuple.userVelocity = velocity
        
        guard inputArray[2].uppercased() == "R" || inputArray[2].uppercased() == "L" else {
            print("유효한 방향을 입력해주세요")
            return nil
        }

        var direction: String {
            if inputArray[2].uppercased() == "R" && velocity >= 0 {
                return "R"
            } else if inputArray[2].uppercased() == "R" && velocity < 0 {
                return "L"
            } else if inputArray[2].uppercased() == "L" && velocity >= 0 {
                return "L"
            } else {
                return "R"
            }
        }
        resultTuple.userDirection = direction
    }
    return resultTuple
}
        
func thrustLetters() -> String? {
    guard let inputReceived = receiveUserInput() else {
        print("function 'thrustLetter'가 function 'receiveUserInput'으로부터 값을 불러오는 데 실패했습니다")
        return nil
    }
    
    var word = inputReceived.0
    let velocity = inputReceived.1
    let direction = inputReceived.2
    
    if direction == "R" {
        if abs(velocity) % word.count > 0 {
            for _ in 0..<(abs(velocity) % word.count) {
                let temp = word.removeLast()
                word = "\(temp)\(word)"
            }
        }
    }
    
    if direction == "L" {
        if abs(velocity) % word.count > 0 {
            for _ in 0..<(abs(velocity) % word.count) {
                let temp = word.removeFirst()
                word = "\(word)\(temp)"
            }
        }
    }
    return word
}
