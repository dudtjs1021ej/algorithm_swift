//
//  ECOTE_greedy1.swift
//  Algorithm
//
//  Created by 임영선 on 2023/09/19.
//
import Foundation

// N M K
// 5 8 6
// 2 4 5 4 6

// M번 더해서 가장 큰 수를 구해라
// 최대 더할 수 있는 수는 K번
// 단 다른 인덱스라면 값이 같아도 다른 수로 취급

let input = readLine()!.split(separator: " ").map {Int($0)!}
var n = input[0], m = input[1], k = input[2]

var array = readLine()!.split(separator: " ").map {Int($0)!}
var answer = 0
array.sort(by: >)

for i in 0..<array.count {
    if m == 0 {
        break
    }
    let count = m-k>0 ? k : m
    m -= count
    answer += array[i]*count
}

print(answer)
