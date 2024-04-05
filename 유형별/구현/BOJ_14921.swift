//
//  BOJ_14921.swift
//  Algorithm
//
//  Created by 임영선 on 2024/04/05.
//

// https://www.acmicpc.net/problem/14921
// BOJ 14921 - 구현, 용액 합성하기: 골드5

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

var left = 0
var right = n-1
var answer = Int.max

while left < right {
    let calc = nums[left] + nums[right] // 두 용액의 합을 계산
    
    // 현재 답보다 0에 가까우면
    if abs(0-calc) < abs(0-answer) {
        answer = calc
    }
    
    // 0이면 바로 정답 처리
    if calc == 0 {
        break
    }
    
    // 값이 음수면 음수값을 줄여줌
    if calc < 0 {
        left += 1
    }
    
    // 값이 양수면 양수값을 줄여줌
    else {
        right -= 1
    }
}

print(answer)

