//:> 2022 KAKAO TECH INTERNSHIP 두 큐 합 같게 만들기
/*:>
 Lv.2
 */

import Foundation

//: 🌱solutionA (53.3)
//53.3퍼 오답, 시간초과
//queueSum double 처리 => 똑같이 53.3%...
func solutionA(_ queue1:[Int], _ queue2:[Int]) -> Int {
   
    var queue1 = queue1
    var queue2 = queue2
    
    let queueSum = Double(queue1.reduce(0, +) + queue2.reduce(0, +))/Double(2.0)
    let totalQueueCnt = queue1.count + queue2.count
    var workCnt = 0
    
    print("queueSum \(queueSum)")
    
    while Double(queue1.reduce(0, +)) != queueSum{
        if queue1.reduce(0, +) > queue2.reduce(0, +){ //queue1 총합이 더 크면 1 값을 2 로 보내기
           
            let tempValue = queue1.first!
            queue1.removeFirst()
            queue2.insert(tempValue, at: queue2.count)
            
        }else{
            let tempValue = queue2.first!
            queue2.removeFirst()
            queue1.insert(tempValue, at: queue1.count)
        }
        
        
        workCnt += 1
        
        print("Q1 : \(queue1) Q2 : \(queue2) workCnt \(workCnt)")
//        if i == queueCnt-1 && queue1.reduce(0, +) != queueSum{
//                workCnt = -1
//        }
        
        if workCnt == totalQueueCnt{
            workCnt = -1
            break
        }
    }
    
    return workCnt
}

//print(solutionA([3, 2, 7, 2], [4, 6, 5, 1]))
//print(solutionA([1, 2, 1, 2], [1, 10, 1, 2]))
//print(solutionA([1, 1], [1, 5]))
//print(solutionA([1, 4], [4, 8]))

//: 🌱solutionB (86.7%) -> (100%)
//배열의 합을 구할 때 reduce 대신 oneSum, twoSum 으로 (시간초과 줄임)
//테스트 1 〉    실패 (0.09ms, 16.3MB)  -> while 문을 totalQueueCnt 만큼이 아니라 totalQueueCnt*2 만큼 돌려서 해결, 돌리는 횟수에 여유를 줌
//시간초과는 queue 복제하는 것을 수정하여 해결
func solutionB(_ queue1:[Int], _ queue2:[Int]) -> Int {
   
    /**
     var queue1 = queue1 으로 하면 깊은 복사
     var queue1 = queue1[0..<queue1.count] 로 하면 주소를 복사함 (시간 줄이기~)
     **/
    var queue1 = queue1[0..<queue1.count]
    var queue2 = queue2[0..<queue2.count]
    
    var oneSum = queue1.reduce(0, +)
    var twoSum = queue2.reduce(0, +)
    
    let queueSum = Double(oneSum + twoSum)/Double(2.0)
    let totalQueueCnt = queue1.count + queue2.count
    var workCnt = 0
    
    
    
    print("queue1 \(queue1) queue2 \(queue2) queueSum \(queueSum)")
    
    while Double(oneSum) != queueSum{
        if oneSum > twoSum{ //queue1 총합이 더 크면 1 값을 2 로 보내기
           
            let tempValue = queue1.first!
            queue1.removeFirst()
            queue2.append(tempValue)
            oneSum -= tempValue
            twoSum += tempValue
            
        }else{
            let tempValue = queue2.first!
            queue2.removeFirst()
            queue1.append(tempValue)
            oneSum += tempValue
            twoSum -= tempValue
        }
        
        
        workCnt += 1
        
        print("Q1 : \(queue1) Q2 : \(queue2) workCnt \(workCnt)")
        
        if workCnt == totalQueueCnt*2{
            workCnt = -1
            break
        }
    }
    
    return workCnt
}

//print(solutionB([3, 2, 7, 2], [4, 6, 5, 1]))
//print(solutionB([1, 2, 1, 2], [1, 10, 1, 2]))
//print(solutionB([1, 1], [1, 5]))
//print(solutionB([1, 4], [4, 8]))
print(solutionB([1,1,1,1,1],[1,1,1,9,1]))

