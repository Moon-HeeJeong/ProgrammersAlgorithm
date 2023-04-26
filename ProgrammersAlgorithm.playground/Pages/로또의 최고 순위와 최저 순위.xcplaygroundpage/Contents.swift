//:> 2021 Dev-Matching: 웹 백엔드 개발자(상반기) 로또의 최고 순위와 최저 순위
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA (100%)
func solutionA(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var matchCnt: Int = 0
    var zeroCnt: Int = lottos.filter({$0 == 0}).count
    
    for win_num in win_nums {
        if lottos.filter({$0 == win_num}).count > 0{
            matchCnt += 1
        }
    }
    
    print("match \(matchCnt)")
    
    let maxMatchCnt = matchCnt + zeroCnt
    
    var minGrade = matchCnt == 0 ? 6 : lottos.count - matchCnt + 1
    var maxGrade = maxMatchCnt == 0 ? 6 : lottos.count - maxMatchCnt + 1
    
    return [maxGrade, minGrade]
}

//print(solutionA([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
//print(solutionA([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))
print(solutionA([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))

//: 🌱solutionB (100%)
//solutionA 코드 정리
func solutionB(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var matchCnt: Int = lottos.filter({win_nums.contains($0)}).count
    var zeroCnt: Int = lottos.filter({$0 == 0}).count
    
    print("match \(matchCnt) zeroCnt \(zeroCnt)")
    
    var minGrade = min(6, lottos.count - matchCnt + 1)
    var maxGrade = min(6, lottos.count - (matchCnt + zeroCnt) + 1)
    
    return [maxGrade, minGrade]
}
//print(solutionB([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
//print(solutionB([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))
print(solutionB([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))
