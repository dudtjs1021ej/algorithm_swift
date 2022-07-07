//
//  basic_BFS1.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/07.
//

import Foundation
// DFS - 미로 찾기
import Foundation

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

func BFS(_ x: Int, _ y: Int) -> Int {
  let queue: Queue = Queue([[Int]]())
  queue.push([x, y])
  
  while !queue.isEmpty {
    let value = queue.pop()!
    let x = value[0]
    let y = value[1]
    
    for i in 0...3 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      
      // 미로찾기 공간을 벗어난 경우 무시
      if nx<0 || nx>=n || ny<0 || ny>=m {
        continue
      }
      
      // 벽인 경우 무시
      if maze[nx][ny] == 0 {
        continue
      }
      
      if maze[nx][ny] == 1 {
        maze[nx][ny] = maze[x][y] + 1
        queue.push([nx, ny])
      }
    }
  }
  // 가장 오른쪽 아래의 최단 거리 반환
  return maze[n-1][m-1]
}
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var maze: [[Int]] = []

for _ in 0..<n {
  let input = Array(readLine()!).map { Int(String($0))! }
  maze.append(input)
}

print(BFS(0,0))

