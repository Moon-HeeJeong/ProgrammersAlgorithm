//:> 연습문제 덧칠하기
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA (fail 투성이~~)
func solutionA(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    let distance = (section.last! - section.first!) + 1
    let howManyPaint = Double(distance)/Double(m)
    let cnt =  ceil(howManyPaint)
    print("distance \(distance) howManyPaint \(howManyPaint) \(cnt)")
    return Int(cnt)
}
//print(solutionA(8, 4, [2,3,6]))
//print(solutionA(17, 4, [2,3,15,16]))
//print(solutionA(8, 2, [2,6])) //반례

//: 🌱solutionB (100%)
//section에서 m만큼 값을 지우는 방법
func solutionB(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var section = section
    var paintingCnt = 0
    
    while !section.isEmpty{
        let startValue = section.first!
        let lastValue = startValue + m - 1
        
        print("startValue \(startValue) lastValue \(lastValue)")
        for i in startValue..<lastValue+1{
            
            if section.first == i{
                section.removeFirst()
            }
            if section.isEmpty{
                break
            }
        }
        
        paintingCnt += 1
        
    }
    return paintingCnt
}
//print(solutionB(8, 4, [2,3,6]))
//print(solutionB(5, 4, [1,3]))
//print(solutionB(8, 2, [2,6]))
print(solutionB(4, 1, [1,2,3,4]))


