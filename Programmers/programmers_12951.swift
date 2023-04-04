//
//  programmers_12951.swift
//  Algorithm
//
//  Created by 임영선 on 2023/04/04.
//  prgrammers 12951 - JadenCase 문자열 만들기 : 문자열

import Foundation

func solution(_ s:String) -> String {
    var arr = Array(s).map {String($0)}
    var isBlanked = true
    for index in 0..<arr.count {
        if isBlanked {
            isBlanked = false
            arr[index] = arr[index].uppercased()
        } else {
            arr[index] = arr[index].lowercased()
        }
        if arr[index] == " " {
            isBlanked = true
        }
    }
    return arr.joined()
}


