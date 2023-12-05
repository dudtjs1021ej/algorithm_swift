//
//  BOJ_7490.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/05.
//

// https://www.acmicpc.net/problem/7490
// BOJ 7490 - DFS 0 만들기: 골드5

import Foundation

func DFS(operators: [String], n: Int) {
    // 부호들을 n-1만큼 구했으면 계산해봄
    if operators.count == n-1 {
        let result = calcNum(operators)
        if result.num == 0 {
            print(result.calcString)
        }
        return
    }
    else {
        // 공백, +, - 순서대로 DFS 돌림
        var arrCopy1 = operators
        arrCopy1.append(" ")
        DFS(operators: arrCopy1, n: n)
        
        var arrCopy2 = operators
        arrCopy2.append("+")
        DFS(operators: arrCopy2, n: n)
        
        var arrCopy3 = operators
        arrCopy3.append("-")
        DFS(operators: arrCopy3, n: n)
    }
}

func calcNum(_ operators: [String]) -> (calcString: String, num: Int) {
    // 계산 수식 문자열 구하기
   var calcString = "1"
    for i in 0..<operators.count {
        calcString += operators[i]+String(i+2)
    }
    
    // 1-2 3+4+5+6+7 -> 1-23+4+5+6+7
    // -> 부호를 모두 공백으로 바꾸고 nums = [1 23 4 5 6 7]
    // -> 공백을 제외한 부호들 = [-, +, +, +, +]
    let stringOfNotBlack = calcString.replacingOccurrences(of: " ", with: "") // 공백을 합쳐줌
    let s1 = stringOfNotBlack.replacingOccurrences(of: "+", with: " ") // +, -를 공백으로 바꿈
    let s2 = s1.replacingOccurrences(of: "-", with: " ")
    let nums = s2.split(separator: " ").map {Int(String($0))!} // 숫자들만 빼옴
    let operatorsWithPlusMinus = operators.filter {$0 != " "}
    var answer = 0

    for i in 0..<nums.count {
        if i == 0 {
            answer += nums[0]
            continue
        }
        let oper = operatorsWithPlusMinus[i-1]
        let num = oper=="+" ? nums[i] : nums[i]*(-1)
        answer += num
    }
    return (calcString, answer)
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!

    DFS(operators: [], n: n)
    print()
}

