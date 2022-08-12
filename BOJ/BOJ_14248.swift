//
//  BOJ_14248.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/13.
//  BOJ 14248 - 점프점프 : DFS
import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
let start = Int(readLine()!)!
var visited = Array(repeating: false, count: n)

func DFS(v: Int) {
  visited[v] = true
  let left = v - arr[v]
  let right = v + arr[v]
  
  if left>=0 && !visited[left] {
    DFS(v: left)
  }
  if right<n && !visited[right] {
    DFS(v: right)
  }
}

DFS(v: start-1)
print(visited.filter{$0 == true}.count)

