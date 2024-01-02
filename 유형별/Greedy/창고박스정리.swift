//
//  창고박스정리.swift
//  Algorithm
//
//  Created by 임영선 on 2023/09/21.

// 창고 박스 정리
// 젤 높은곳에서 젤 낮은 곳으로 옮김

import Foundation

let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map {Int($0)!}
var m = Int(readLine()!)!
arr.sort()

for _ in 0..<m {
    arr[0] += 1
    arr[n-1] -= 1
    if (arr[0] > arr[1]) || (arr[n-1] < arr[n-2]) {
        arr.sort()
    }
}

print(arr[arr.count-1]-arr[0])

/*
10
69 42 68 76 40 87 14 65 76 81
50
*/
