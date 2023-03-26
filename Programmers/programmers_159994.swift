//
//  programmers_159994.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/26.
//  Programmers 159994 - 카드 뭉치 : 구현

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var goal = goal; var cards1 = cards1; var cards2 = cards2
    while !goal.isEmpty {
        if goal.first == cards1.first {
            goal.removeFirst()
            cards1.removeFirst()
        } else if goal.first == cards2.first {
            goal.removeFirst()
            cards2.removeFirst()
        } else {
            return "No"
        }
    }
    return "Yes"
}
