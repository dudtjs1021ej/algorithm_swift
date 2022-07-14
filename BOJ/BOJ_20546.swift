//
//  BOJ_20546.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/14.
// BOJ 20546 - 기적의 매매법 : 구현

func BNP(_ money: Int) -> Int {
  var money = money
  var count = 0 // 주식 수
  for i in 0..<14 {
    if money >= stock[i] {
      count += Int(money/stock[i])
      money = money % stock[i]
    }
  }
  return money+(stock[13]*count)
}

func TIMING(_ money: Int) -> Int {
  var money = money
  var count = 0
 
  for i in 0..<11 {
    // 3일연속 주가 상승 -> 전량 매도
    if stock[i] < stock[i+1] && stock[i+1] < stock[i+2] {
      if count > 0 {
        money += count*stock[i+3]
        count = 0
      }
    }
    // 3일연속 주가 하락 -> 전량 매수
    else if stock[i] > stock[i+1] && stock[i+1] > stock[i+2] {
      if money>=stock[i+3] {
        count += Int(money/stock[i+3])
        money = money % stock[i+3]
      }
    }
  }
  return money+(stock[13]*count)
}

let money = Int(readLine()!)!
let stock = readLine()!.split(separator: " ").map {Int($0)!}

let BNPMoney = BNP(money)
let TIMINGMoney = TIMING(money)
if BNPMoney>TIMINGMoney {
  print("BNP")
}
else if BNPMoney<TIMINGMoney {
  print("TIMING")
}
else {
  print("SAMESAME")
}
