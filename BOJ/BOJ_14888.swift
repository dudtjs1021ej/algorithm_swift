//
//  BOJ_14888.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/09.
//  BOJ 14888 - 연산자 끼워넣기 : DFS
import Foundation

// 연산자 유형 typealias
typealias Operation = (Int, Int) -> Int

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
var operationNums = readLine()!.split(separator: " ").map {Int(String($0))!}

var results: [Int] = []

func add(_ x: Int, _ y: Int) -> Int {x+y}
func sub(_ x: Int, _ y: Int) -> Int {x-y}
func mul(_ x: Int, _ y: Int) -> Int {x*y}
func dev(_ x: Int, _ y: Int) -> Int {x/y}

// 연산자들의 배열
let operations: [Operation] = [add, sub, mul, dev]

func DFS(nowIndex: Int, result: Int) {
  if nowIndex == n {
    results.append(result)
    return
  }
  for i in 0..<4 {
    if operationNums[i] != 0 {
      operationNums[i] -= 1
      DFS(nowIndex: nowIndex+1, result: operations[i](result, arr[nowIndex]))
      operationNums[i] += 1
    }
  }
}

DFS(nowIndex: 1, result: arr[0])

print(results.max()!)
print(results.min()!)
