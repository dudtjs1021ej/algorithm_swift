//
//  programmers_92335.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/23.
//  Programmers 92335 - k진수에서 소수 개수 구하기 : 구현

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let transNum = String(n, radix: k)
    var nums = transNum.split(separator: "0").map {String($0)}
    nums = nums.filter{isPrime(Int($0)!) == true}
    return nums.count
}

func isPrime(_ num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}
