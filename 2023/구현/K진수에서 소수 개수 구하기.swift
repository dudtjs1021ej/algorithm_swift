//
//  K진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/30.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    func isPrime(_ num: Int) -> Bool {
        if num < 2 {
            return false
        }
        if num == 2 || num == 3 {
            return true
        }
        let s = Int(sqrt(Double(num)))
        for i in 2...s {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    let num = String(n, radix: k)
    let nums = num.split(separator: "0").map {Int(String($0))!}
    var answer = 0
    for n in nums {
        if isPrime(n) {
            answer += 1
        }
    }
    return answer
}
