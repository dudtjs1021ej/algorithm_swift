//
//  씨름 선수.swift
//  Algorithm
//
//  Created by 임영선 on 2023/09/19.

// 씨름 선수
// 내가 모든 사람보다 키가 크거나 몸무게가 많이 나가야 선정

import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    arr.append(input)
}

// 키 순으로 정렬
arr.sort(by: { $0[0] > $1[0] })
print(arr)
var answer = 1

for i in 1..<arr.count {
    for j in 0..<i {
        if arr[i][1] <= arr[j][1] {
            break
        }
        if (j == i-1) && arr[i][1] > arr[j][1] {
            answer += 1
        }
    }
}

print(answer)
