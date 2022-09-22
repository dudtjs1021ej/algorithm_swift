//
//  programmers_92334.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/22.
//  Programmers 92334 - 신고 결과 받기 : 구현

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dict: [String: [String]] = [:]
    var arr: [Int] = Array(repeating: 0, count: id_list.count)
    var ids: [String: Int] = [:]
    
    for (index, id) in id_list.enumerated() {
        ids[id] = index
    }
    
    // [ 신고당한사람 : [신고자] ]
    for repo in report {
        let arr = repo.split(separator: " ").compactMap { String($0) }
        let report = arr[1]
        let reported = arr[0]
        if dict[report] == nil {
            dict.updateValue([reported], forKey: report)
        } else {
           // 중복 신고 제외
            if !dict[report]!.contains(reported) {
                dict[report]!.append(reported)
            }
        }
    }


    for name in dict.keys {
        if dict[name]!.count >= k {
            for n in dict[name]! {
                arr[ids[n]!] += 1
            }
        }
    }
    
    return arr
}
