//
//  BOJ_2212.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
//  BOJ 2212 - 센서 : 그리디
import Foundation
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var cordinate = readLine()!.split(separator: " ").map {Int($0)!}
var distance: [Int] = []
cordinate.sort()
for i in 0..<n-1 {
  distance.append(cordinate[i+1]-cordinate[i])
}
distance.sort()
for _ in 0..<k-1 {
  distance.popLast()
}
print(distance.reduce(0,+))

