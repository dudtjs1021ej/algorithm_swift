//
//  BOJ_1654.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/29.
//  BOJ 1654 - 랜선 자르기 : 이분탐색

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let k = input[0], n = input[1]
var arrs = [Int]()
for _ in 0..<k {
    arrs.append(Int(readLine()!)!)
}

var left = 1
var right = arrs.max()!
var answer = 0
while left <= right {
    
    let mid = (left+right) / 2
    var sum = 0
    for arr in arrs {
        sum += arr/mid
    }

    if sum >= n {
        answer = mid // n개이상 랜선을 구할 수 있는 경우 answer에 저장
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)
