//
//  programmers_86051.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/11.
// 프로그래머스 86051 - 없는 숫자 더하기

import Foundation

func solution(_ numbers:[Int]) -> Int {
    let allNumbers = [0,1,2,3,4,5,6,7,8,9]
    let answer = allNumbers.filter {!numbers.contains($0)}
    return answer.reduce(0,+)
}
