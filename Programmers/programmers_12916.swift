//
//  programmers_12916.swift
//  Algorithm
//
//  Created by 임영선 on 2023/04/13.
//  programmers 12916 - 문자열 내 p와 y의 개수 : 구현

import Foundation

func solution(_ s:String) -> Bool {
    let s = s.lowercased()
    return s.filter {$0=="y"}.count == s.filter {$0=="p"}.count
}
