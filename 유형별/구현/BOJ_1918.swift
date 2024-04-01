//
//  BOJ_1918.swift
//  Algorithm
//
//  Created by 임영선 on 2024/04/01.
//

// https://www.acmicpc.net/problem/1918
// BOJ 1918 - 스택, 후위 표기식: 골드2

import Foundation

let str = Array(readLine()!).map {String($0)}
var stack: [String] = []

var answer = ""

for s in str {
    switch s {
    // 1. *, / 연산일 때
    case "*", "/":
        // 비어있으면 바로 넣음
        if stack.isEmpty {
            stack.append(s)
            break
        }
        
        // 나랑 같은 우선순위면 계속 뺌
        while let last = stack.last, (last == "*" || last == "/") {
            answer += stack.popLast()!
        }
        stack.append(s)
        
    // 2. +, - 연산일 때
    case "+", "-":
        // 비어있으면 넣음
        if stack.isEmpty {
            stack.append(s)
            break
        }
        
        while let last = stack.last {
            // 괄호가 있으면 넘어감
            if last == "(" {
                break
            }
            answer += stack.popLast()! // 괄호 없으면 다 뺌
        }
        stack.append(s)
      
    // 3. 괄호일 때
    case "(":
        stack.append(s) // 스택에 넣음
    
    // 괄호 끝날 때까지 계속 뺌
    case ")":
        while let last = stack.popLast() {
            if last == "(" {
                break
            }
            answer += last
        }
        
    // 연산자 아니면 바로 넣음
    default:
        answer += s
    }
}

print(answer+stack.reversed().joined())


/*
 
 */

