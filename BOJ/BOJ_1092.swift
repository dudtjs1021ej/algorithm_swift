//
//  BOJ_1092.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
// BOJ 1092 - 배 : 그리디
import Foundation
let n = Int(readLine()!)!
var cranes = readLine()!.split(separator: " ").map {Int($0)!}
let m = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map {Int($0)!}

cranes.sort(by: >)
boxes.sort(by: >)

if cranes[0] < boxes[0] {
  print("-1")
}
else {
  var time = 0
  while !boxes.isEmpty {
    for crane in cranes {
      for i in 0..<boxes.count {
        if crane >= boxes[i] {
          boxes.remove(at: i)
          break
        }
      }
    }
    time += 1
  }
  print(time)
  
}
