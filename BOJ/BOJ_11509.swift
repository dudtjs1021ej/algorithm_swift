//
//  BOJ_11509.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/27.
// BOJ 11509 - 풍선 맞추기 : 그리디
import Foundation
let n = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map {Int(String($0))!}
var cnt = [Int](repeating: 0, count: 1000001) // 발사된 각 화살의 높이

for height in heights {
  // 만약에 그 높이에 화살이 발사되어 있으면
  if cnt[height] > 0 {
    // 풍선을 터뜨리고 원래 화살을 뺌
    // 화살의 높이 -1에 화살을 다시 조준
    cnt[height] -= 1
    cnt[height-1] += 1
  }
  // 화살이 없다면
  else {
    // 풍선을 터뜨리고 높이 -1에 화살을 다시 조준
    cnt[height-1] += 1
  }
}
print(cnt.reduce(0, +))

