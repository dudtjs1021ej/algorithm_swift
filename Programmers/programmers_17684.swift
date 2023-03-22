//
//  programmers_17684.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/22.
//  Programmers 17684 - [3차] 압축 : 구현

import Foundation

func solution(_ msg:String) -> [Int] {
    let msg = msg.map { String($0) }
    var dictionary = [String: Int]()
    var answer = [Int]()
    var num = 26
    
    // A~Z 딕셔너리에 넣어줌
    for i in 1...num {
        let alphabet = String(UnicodeScalar(64+i)!)
        dictionary[alphabet] = i
    }
    
    var w: String = "" // 현재 문자열
    var wc: String = "" // 현재 문자열+다음 문자열
    for i in 0..<msg.count {
        w += msg[i]
        
        if i == msg.count-1 { // 마지막 문자열이면 현재 문자열 색인번호 넣고 끝냄
            answer.append(dictionary[w]!)
            break
        } else {
            wc = w+msg[i+1] // 다음문자열을 더한 wc
        }
        
        if dictionary[wc] == nil { // wc가 사전에 없다면
            num += 1
            dictionary[wc] = num // wc를 사전에 넣어줌
            answer.append(dictionary[w]!) // 답엔 w를 넣어줌
            w = "" // w와 wc 빈 값으로 초기화
            wc = ""
        }
    }
    print(dictionary)
    return answer
}

