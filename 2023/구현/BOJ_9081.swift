//
//  BOJ_9081.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/15.
//

// https://www.acmicpc.net/problem/9081
// BOJ 9081 - next permutation: 단어 맞추기, 실버1

import Foundation

let n = Int(readLine()!)!

func convertNextDict(_ targetArr: [String]) -> String {
    var convertIndex: Int? = nil
    var answer = ""
    
    // 한자리 문자열은 그대로 리턴
    if targetArr.count == 1 {
        return targetArr[0]
    }
    
    // 뒤부터 돌며 앞숫자가 뒷숫자보다 큰 지점을 찾아서 convertIndex에 저장
    for i in stride(from: targetArr.count-1, through: 1, by: -1) {
        if targetArr[i] > targetArr[i-1] {
            convertIndex = i-1
            break
        }
    }
    if let convertIndex = convertIndex {
        // 찾은 지점 기준 앞 문자열은 그대로 답에 저장
        let frontString = targetArr[0..<convertIndex].joined()
        answer += frontString
        
        // 찾은 지점 기준 뒷 구간 배열에 저장
        var backArr: [String] = []
        for i in convertIndex..<targetArr.count {
            backArr.append(targetArr[i])
        }
        backArr.sort() // 오름차순 정렬
        
        for i in 0..<backArr.count {
            // 찾은 지점의 문자열보다 큰 문자열 나오면 답에 저장
            if backArr[i] > targetArr[convertIndex] {
                answer += backArr.remove(at: i)
                break
            }
        }
        answer += backArr.joined()  // 나머지 남은 문자열 답에 저장
        return answer
    }
    // 뒷숫자보다 큰 구간을 못찾았으면 원본 문자열 리턴
    else {
        return targetArr.joined()
    }
    
}

for _ in 0..<n {
    let arr = readLine()!.map {String($0)}
    print(convertNextDict(arr))
}

