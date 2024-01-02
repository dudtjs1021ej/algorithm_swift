
// 부분집합 구하기
// 합이 같은 부분집합
// DFS
import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
var isUsed = Array(repeating: false, count: n)
let total = arr.reduce(0, +)

func DFS(_ l: Int, _ sum: Int) {
    if sum > total/2 {
        return
    }
    if l == n {
        if sum == total-sum {
            print("YES")
            exit(0)
        }
    }
    else {
        DFS(l+1, sum+arr[l])
        DFS(l+1, sum)
    }
    
}

DFS(0, 0)
print("NO")


/*
 1. 즉시 프로그램 종료는 exit(0)으로
 2. 두가지 집합이 같은지 확인할 때 -> total-sum == sum 이 같은지 확인하면 됨
 3. DFS의 매개변수에 sum을 담자
 4. DFS 밑에를 컷 할 수 있으면 컷하자 -> total/2보다 sum이 커지면 당연히 합이 같을 수가 없어서 컷
 */
 

/*
6
1 3 5 6 7 10
 
7
1 2 3 4 5 6 7
 
9
3 6 1 4 7 16 34 23 12
 
9
3 6 13 11 7 16 34 23 12
*/
