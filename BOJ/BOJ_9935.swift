//
//  BOJ_9935.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/21.
//  BOJ 9935 - 문자열 폭발 : 문자열

import Foundation

let targetString = readLine()!.map { String($0) }
let bomb = readLine()!.map { String($0) }
var stack = [String]()

for i in 0..<targetString.count {
    stack.append(targetString[i])
    if stack.last! == bomb.last! // 현재 스택의 마지막 문자와 폭탄의 마지막 문자 같은지
        && stack.count >= bomb.count // 스택의 개수가 폭탄의 개수보다 많은지 (인덱스 에러나지 않게)
        && stack[stack.count-bomb.count..<stack.count].joined() == bomb.joined() { // 스택에 폭탄이 있는지
        for _ in 0..<bomb.count {
            stack.removeLast()
        }
    }
}

print(stack.isEmpty ? "FRULA" : stack.joined())


