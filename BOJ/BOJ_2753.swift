//
//  BOJ_2753.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/12.
// BOJ 2753 - 윤년 : 구현
let year = Int(readLine()!)!

if ((year%4 == 0) && (year%100 != 0)) || (year%400 == 0) {
  print("1")
}
else {
  print("0")
}
