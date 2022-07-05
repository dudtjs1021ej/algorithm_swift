//
//  File.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/05.
//

import Foundation

// 구현 - 문자열 재정렬
let input = Array(readLine()!).map { String($0) }
var sum = 0
var alphatbet: [String] = []
// 숫자 0~9는 아스키코드값 48~57
for i in input {
  let asciiNum = (Character(i).asciiValue)!
  if asciiNum>=48 && asciiNum<=57 {
    sum += Int(i)!
  }
  else {
    alphatbet.append(i)
  }
}
alphatbet = alphatbet.sorted()
if sum != 0 {
  alphatbet.append(String(sum))
}
for i in alphatbet {
  print(i, terminator: "")
}


