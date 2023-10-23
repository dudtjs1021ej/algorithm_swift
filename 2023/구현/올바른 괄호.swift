//
//  올바른 괄호.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/23.
//

import Foundation

/*
 배열의 append를 사용했더니 시간 초과..
 문자열이나 정수형을 쓰자
 */

func solution(_ s:String) -> Bool
{
    let str = s.map {String($0)}
    var stack = 0
    
    for s in str {
        if s == "(" {
            stack += 1
        }
        else {
            if stack == 0 {
                return false
            } else {
                stack -= 1
            }
        }
    }
    
    return stack == 0
}

solution(")()(")
