//
//  13.swift
//  Algorithm
//
//  Created by 임영선 on 2022/06/29.
//

import Foundation

// 띄어쓰기로 정수 여러 개 입력 받기
let input = readLine()!.split(separator: " ").map {
  Int(String($0))!
}
print(input[0], input[1])
