
//:> 2019 KAKAO BLIND RECRUITMENT 실패율
/*:>
Lv.1
 */

import Foundation

//: 🌱solution (70%/100%)
//첨에 70퍼 밖에 안떠서 왜 그렇지 하다가 soulutionB로 다른방식으로 풀고 있었는데
//notCompleted/(completed+notCompleted) 가 아니라 notCompleted/completed 로 계산하고 있어서 그런거였다.. 왜 그렇게 생각했지
func solutionA(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var failureRate: [Int:Float] = [:]
    
    for i in 0..<N{
        var notCompleted: Float = 0
        var completed: Float = 0
        
        stages.map { v in
            if v == i+1{
                notCompleted += 1.0
            }else if v > i+1{
                completed += 1.0
            }
        }
        
        print("\(i+1)번 스테이지 실패율은 notCompleted \(notCompleted)명 completed \((completed+notCompleted))명으로 실패율은 \(notCompleted/(completed+notCompleted))이다")
        if completed == 0.0 && notCompleted > 1.0 {
            failureRate[i+1] = 1
        }else if completed == 0.0 && notCompleted == 0.0{
            failureRate[i+1] = 0
        }else{
            failureRate[i+1] = notCompleted/(completed+notCompleted)
        }
    }
    
    print(failureRate)
    
    let failureArray = failureRate.sorted { first, second in
        if first.value > second.value{
            return true
        }else if first.value == second.value{
            if first.key < second.key{
                return true
            }
            return false
        }
        return false
    }
    
    print(failureArray)
    return failureArray.map({$0.key})
}

//print(solutionA(5, [2, 1, 2, 6, 2, 4, 3, 3]))
print(solutionA(5, [4,4,4]))
//print(solutionA(4, [4,4,4,4,4]))

//: 🌱solutionB (풀다가 solutionA로 풀어서.. 정지 ㅎ)
//solutionA는 N을 돌려서 N마다의 실패율을 구하는 방식이었는데
//solutionB는 stages를 돌려서 도전중인 사람, 성공한 사람 값을 배열로 다 넣고 계산하는 방식
func solutionB(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var failureRate: [Int:Float] = [:]
    
    var notCompleted: [Float] = Array.init(repeating: 0, count: N)
    var completed: [Float] = Array.init(repeating: 0, count: N)
    
    for stage in stages {
        print("state \(stage)")
        
        for i in 0..<stage{
            if stage == 1{
            }else if i < stage-1{
                completed[i] += 1.0
            }else if stage == N+1{
                print("다 푼 사람")
                completed[i] += 1.0
            }
        }
        
        if stage == N+1{
            
        }else if stage > 1{
            notCompleted[stage-1] += 1.0
        }
        print("com\(completed) uncom \(notCompleted)")
        
    }
    
    for i in 0..<N{
        failureRate[i+1] = notCompleted[i]/completed[i]
    }
    
    
    print(failureRate)
    
    let failureArray = failureRate.sorted { first, second in
        if first.value > second.value{
            return true
        }else if first.value == second.value{
            if first.key < second.key{
                return true
            }
            return false
        }
        return false
    }
    
    print(failureArray)
    return failureArray.map({$0.key})
}

print(solutionB(5, [2, 1, 2, 6, 2, 4, 3, 3]))
//print(solutionB(4, [4,4,4,4,4]))
