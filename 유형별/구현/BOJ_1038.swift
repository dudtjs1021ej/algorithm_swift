//
//  BOJ_1038.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/20.
//

// https://www.acmicpc.net/problem/1038
// BOJ 1038 - 탐색, 감소하는 수: 골드5

import Foundation

let n = Int(readLine()!)!
let MAX = 9876543211
var dp = Array(repeating: MAX, count: 1000001)

// 0~9 넣어줌
for i in 0...9 {
    dp[i] = i
}

var pointer = 0 // 비교할 숫자 가리킴
var insertIndex = 10 // 새로운 숫자를 삽입할 인덱스

while true {
    let num = dp[pointer] // 320
    pointer += 1
    if num == MAX {
        break
    }
    let numArr = Array(String(num)).map {Int(String($0))!}
    let firstNum = numArr.first!
    // 첫 번째 수가 9면 넘어감
    if firstNum == 9 {
        continue
    }
    // 비교할 숫자 앞에 더 큰 수 붙여줌 ex) 10이면 -> 210, 310, 410, 510 ... 910
    for i in (firstNum+1)...9 {
        let arr = [i]+numArr
        let dpNum = Int(arr.map {String($0)}.joined())!
        dp[insertIndex] = dpNum
        insertIndex += 1 // 삽입인덱스 +1
    }
}

dp.sort() // 오름차순 정렬
print(dp[n] == MAX ? -1 : dp[n])

