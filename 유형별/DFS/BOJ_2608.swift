//
//  BOJ_2608.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/29.
//

// https://www.acmicpc.net/problem/2608
// BOJ 2608 - 로마 숫자: 골드5

import Foundation

var dict = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
    "IV": 4,
    "IX": 9,
    "XL": 40,
    "XC": 90,
    "CD": 400,
    "CM": 900
]

// value값이 큰 순 정렬
let sortedDict = dict.sorted { (a,b) in
    return a.value > b.value
}

// 아라비아문자로 바꿔주는 메소드
func convertToArabia(_ str: String) -> Int {
    let arr = str.map {String($0)}
    var num = 0
    var isTwoRoman = false
    for i in 0..<arr.count-1 {
        // 전에 문자랑 합쳐진 문자면 패스
        if isTwoRoman {
            isTwoRoman = false
            continue
        }
        // 뒤에가 더 큰수면
        if dict[arr[i]]! < dict[arr[i+1]]! {
            let s = arr[i]+arr[i+1]
            num += dict[s]!
            isTwoRoman = true
        }
        else {
            num += dict[arr[i]]!
        }
    }
    if !isTwoRoman {
        num += dict[arr[arr.count-1]]!
    }
    
    return num
}

var targetNum = 0
for _ in 0..<2 {
    let str = readLine()!
    targetNum += convertToArabia(str)
}

print(targetNum)

// 이용 가능한 문자인지 체크하는 메소드
// V L D -> 한 번만 사용 가능
// I X C M -> 연속 3번만 사용 가능
func isEnabledRomanNum(_ arr: [String]) -> Bool {
    let str = arr.joined()
    let strArr = str.map {String($0)}
    var vNum = 0; var lNum = 0; var dNum = 0 // 한 번만 사용할 수 있는 것들
    var iNum = 0; var xNum = 0; var cNum = 0; var mNum = 0; // 연속 세번까지만 가능
    for i in 0..<strArr.count {
        let s = strArr[i]
        switch s {
        case "V":
            iNum = 0; xNum = 0; cNum = 0; mNum = 0
            vNum += 1
        case "L":
            iNum = 0; xNum = 0; cNum = 0; mNum = 0
            lNum += 1
        case "D":
            iNum = 0; xNum = 0; cNum = 0; mNum = 0
            dNum += 1
        case "I":
            xNum = 0; cNum = 0; mNum = 0
            iNum += 1
        case "X":
            iNum = 0; cNum = 0; mNum = 0
            xNum += 1
        case "C":
            iNum = 0; xNum = 0; mNum = 0
            cNum += 1
        case "M":
            iNum = 0; xNum = 0; cNum = 0
            mNum += 1
        default:
            break
        }
        if vNum > 1 || lNum > 1 || dNum > 1 || iNum > 3 || xNum > 3 || cNum > 3 || mNum > 3 {
            return false
        }
    }
    return true
}

func DFS(arr: [String], totalNum: Int, currentNum: Int) {
    if totalNum == targetNum {
        print(arr.joined())
        exit(0)
    }
    else {
        for element in sortedDict {
            // 앞에 문자값보다 작거나 같을 때
            if element.value <= currentNum {
                var arrCopy = arr
                arrCopy.append(element.key)
                // 타겟 넘버보다 작고 만들 수 있는 로마문자인 경우
                if totalNum+element.value <= targetNum && isEnabledRomanNum(arrCopy) {
                    DFS(arr: arrCopy, totalNum: totalNum+element.value, currentNum: element.value)
                }
            }
        }
    }
}

DFS(arr: [], totalNum: 0, currentNum: 1001)

