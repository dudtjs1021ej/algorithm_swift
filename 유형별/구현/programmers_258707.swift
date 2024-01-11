//
//  programmers_258707.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/10.
//

// https://school.programmers.co.kr/learn/courses/30/lessons/258707
// 프로그래머스 258707 - n + 1 카드게임, 레벨3
import Foundation

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    var coin = coin
    let n = cards.count
    var point = n/3
    var myCards = cards[0..<n/3].map {Int(String($0))!} // n/3개 가지고 시작
    var keepCards: [Int] = []
    var round = 1
    let target = n+1
    
myLoop:
    while true {
        // 코인도 없고 낼 수 있는 카드도 없으면
        if (myCards.isEmpty && coin <= 1) || (point == n) {
            break
        }
        let card1 = cards[point]
        let card2 = cards[point+1]
        keepCards.append(card1)
        keepCards.append(card2)

        for i in 0..<myCards.count-1 {
            for j in i+1..<myCards.count {
                let myCard1 = myCards[i]
                let myCard2 = myCards[j]
                // 내 카드에서 2장을 뽑을 수 있으면
                if (myCard1+myCard2) == target {
                    round += 1
                    point += 2
                    myCards = myCards.filter {$0 != myCard1 && $0 != myCard2}
                    continue myLoop
                }
            }
        }
       
        // 코인이 1개 이상 남아있고 내카드+킵해둔 카드를 낼 수 있으면
        if coin >= 1 {
            for i in 0..<myCards.count {
                for j in 0..<keepCards.count {
                    let myCard = myCards[i]
                    let keepCard = keepCards[j]
                    
                    // 내카드 + 킵카드써서 코인 1개 소모
                    if myCard+keepCard == target {
                        round += 1
                        coin -= 1
                        point += 2
                        myCards.remove(at: i)
                        keepCards.remove(at: j)
                        continue myLoop
                    }
                }
            }
        }
        
        // 코인이 2개이상 남아있고 킵해둔 카드에서 다 낼 수 있으면
        if coin >= 2 {
            for i in 0..<keepCards.count-1 {
                for j in i+1..<keepCards.count {
                    let keepCard1 = keepCards[i]
                    let keepCard2 = keepCards[j]
                    
                    // 킵카드 2개 써서 코인 2개 소모
                    if (keepCard1+keepCard2) == target {
                        round += 1
                        coin -= 2
                        point += 2
                        keepCards = keepCards.filter {$0 != keepCard1 && $0 != keepCard2}
                        continue myLoop
                    }
                }
            }
        }
        break
    }
    return round
}

print(solution(4, [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]))
