//
//  programmers_42862.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/30.
// 프로그래머스 42862 - 체육복 : 그리디
import Foundation
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 각 학생들의 체육복 개수
    var students = [Int](repeating: 1, count: n)
    for l in lost {
        students[l-1] = 0
    }
    for r in reserve {
        students[r-1] += 1
    }
    
    var count = 0 // 체육복 못빌린 학생 수
    for i in 0..<n {
        // 체육복이 없으면
        if students[i] == 0 {
            // 앞에 학생한테 빌리는 경우
            if i>0 && students[i-1] > 1{
                students[i-1] -= 1
                students[i] = 1
            }
            // 뒤에 학생한테 빌리는 경우
            else if i<n-1 && students[i+1] > 1 {
                students[i+1] -= 1
                students[i] = 1
            }
            // 못빌린 경우
            else {
                count += 1
            }
        }
    }
    return n-count
}

