//
//  BOJ_5579.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/13.
// BOJ 5579 - 과제 안내신 분 : 구현
var students: [Int] = []

for i in 1...30 {
  students.append(i)
}

for _ in 0..<28 {
  let input = Int(readLine()!)!
  students = students.filter {$0 != input}
}

print(students[0])
print(students[1])
