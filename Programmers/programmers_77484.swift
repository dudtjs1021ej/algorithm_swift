//
//  programmers_77484.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/10.
// 프로그래머스 77484 - 로또의 최고 순위와 최저 순위
import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
  // 0을 제외한 숫자들
  let noZeroNums = lottos.filter{$0 != 0}
  
  // 0의 개수
  let zeroCount = lottos.filter{$0==0}.count
  
  // 당첨된 숫자들
  let winCount = noZeroNums.filter{win_nums.contains($0)}.count
  
  let minGrade = 6-winCount+1
  let maxGrade = 6-(winCount+zeroCount)+1
  return [min(maxGrade, 6), min(minGrade, 6)]
}
