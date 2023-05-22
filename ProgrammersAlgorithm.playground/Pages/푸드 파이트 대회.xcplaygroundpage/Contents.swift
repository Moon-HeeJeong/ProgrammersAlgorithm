//:> 연습문제 푸드 파이트 대회
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA (100%)
//다른 방법으로는 왼쪽은 스택 오른쪽은 큐로 해서 나중에 스트링으로 합치는 방법도 있다..!

func solution(_ food:[Int]) -> String {
    
    let severalFood: [Int] = food.map { v in
        return v/2
    }
    
    var arrangement: [Int] = Array(repeating: 0, count: severalFood.reduce(0, +)*2+1)
    
    var firstIdx = 0
    var lastIdx = arrangement.count - 1
    
    for i in 0..<severalFood.count{
        print("food \(severalFood)")
        
        if i > 0{
            for _ in 0..<severalFood[i]{
                arrangement[firstIdx] = i
                arrangement[lastIdx] = i
                
                firstIdx += 1
                lastIdx -= 1
            }
        }
        print("arrange \(arrangement)")
        
    }
    
    let arrangeStr: String = arrangement.reduce("", { first, second in
            first + "\(second)"
        })
    
    return arrangeStr
}

print(solution([1, 3, 4, 6]))
