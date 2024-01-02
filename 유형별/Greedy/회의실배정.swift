//
//  회의실배정.swift
//  Algorithm
//
//  Created by 임영선 on 2023/09/19.
//
// 회의실 배정

import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    arr.append(input)
}


arr.sort(by: { $0[1] < $1[1] })

var answer = 0
var endTime = Int.min

for a in arr {
    if a[0] >= endTime {
        answer += 1
        endTime = a[1]
    }
}
print(answer)
