//:> 연습문제 과일장수
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA
//시간 초과
func solutionA(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    print("\(score.count) / \(m) \(score.count / m)개 포장 가능")
    let packageCnt = score.count / m
    var package: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: packageCnt) //초기화셋팅해주기
    var scoreArr = score
    
    var profit = 0
    
    for i in 0..<packageCnt{
        print("\(i)번째 패키지 포장 중....")
        
        for j in 0..<m{
            let maxIdx = scoreArr.firstIndex(of: scoreArr.max() ?? 0) ?? 0
            package[i][j] = scoreArr[maxIdx]
            scoreArr.remove(at: maxIdx)
            
            if j == m-1{
                profit += package[i].min()! * m
                print("\(i)번째 패키지 포장 완료! \(package[i]) 이익 \(profit)")
            }
        }
    }
    return profit
}
//print(solutionA(3,4,[1, 2, 3, 1, 2, 3, 1]))
//print(solutionA(4,3,[4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))

//: 🌱solutionB
//시간초과.................
func solutionB(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let packageCnt = score.count / m
    var scoreArr = score
    
    var profit = 0
    
    for i in 0..<packageCnt{
        var minValue = 9
        
        for j in 0..<m{
            let maxIdx = scoreArr.firstIndex(of: scoreArr.max() ?? 0) ?? 0
            minValue = min(scoreArr[maxIdx], minValue)
            scoreArr.remove(at: maxIdx)
            
            if j == m-1{
                profit += minValue * m
            }
        }
    }
    return profit
}
//print(solutionB(3,4,[1, 2, 3, 1, 2, 3, 1]))
print(solutionB(4,3,[4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))


//: 🌱solutionC (100.0%)
func solutionC(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let packageCnt = score.count / m
    var scoreArr = score.sorted(by: <)
    
    var profit = 0
    
    var idx = (score.count - 1) - (m - 1)
    
    for i in 0..<packageCnt{
        
        print("array \(scoreArr) idx \(idx) pickValue \(scoreArr[idx])")
        
        profit += scoreArr[idx] * m
        
//        scoreArr.remove(at: maxIdx) //이 코드 있으면 시간초과 뜸
        
        idx -= m
    }
    return profit
}
//print(solutionC(3,4,[1, 2, 3, 1, 2, 3, 1]))
print(solutionC(4,3,[4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
