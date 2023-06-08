//:> 연습문제 시소 짝꿍
/*:>
 */

import Foundation


//아직 못 풀었다...

//: 🌱solution (17.6%)..ㅋ
func solution(_ weights:[Int]) -> Int64 {
    
    var weightDict: [Int:Bool] = [:]
    var weightArr:[Int] = Array(Set(weights))
    var coupleCnt = 0

    for w in weights{
        
        // 2-2 / 3-3 / 4-4 의 경우
        if let _ = weightDict[w]{
            coupleCnt += 1
        }else{
            weightDict[w] = false
        }
    }
    
    print("dict  \(weightDict) coupleCnt \(coupleCnt)")
    
    for i in 0..<weightDict.count{
        let w = weightArr[i]
        print("check \(w)")
        
        //2-4 의 경우
        if let twice = weightDict[w*2]{
            print("find twice \(w*2)")
            coupleCnt += 1
        }
        
        //2-3 의 경우
        let divideTwo = w/2
        if let twoSthree = weightDict[divideTwo*3]{
            print("find 2/3 \(divideTwo*3)")
            coupleCnt += 1
        }
        //3-4 의 경우
        let divideThree = w/3
        if let twoSthree = weightDict[divideThree*4]{
            print("find 3/4 \(divideThree*4)")
            coupleCnt += 1
        }
    }
    
    return Int64(coupleCnt)
}
//print(solution([100,180,360,100,270]))

//: 🌱solutionB (17.6%)
func solutionB(_ weights:[Int]) -> Int64 {
    
    var weightDict: [Double:Bool] = [:]
    var coupleCnt = 0
    var weightSet = Set<Double>()
    
    for w in weights{
        weightSet.insert(Double(w))
        
        // 2-2 / 3-3 / 4-4 의 경우
        if let _ = weightDict[Double(w)]{
//            if !weightDict[Double(w)]!{
                coupleCnt += 1
//                weightDict[Double(w)] = true
//            }
        }else{
            weightDict[Double(w)] = false
        }
    }
    
    var weightArr:[Double] = Array(weightSet)
    
    print("dict  \(weightDict) coupleCnt \(coupleCnt)")
    
    for i in 0..<weightDict.count{
        let w = weightArr[i]
        print("check \(w)")
        
        //2-4 의 경우
        if let twice = weightDict[w*2]{
            print("find twice \(w*2)")
            coupleCnt += 1
        }
        
        //2-3 의 경우
        let divideTwo = w/2
        if let twoSthree = weightDict[divideTwo*3]{
            print("find 2/3 \(divideTwo*3)")
            coupleCnt += 1
        }
        
        
        
        //3-4 의 경우
        let divideThree = w/3
        if let twoSthree = weightDict[divideThree*4]{
            print("find 3/4 \(divideThree*4)")
            coupleCnt += 1
        }
        
//        //3-2 의 경우
//        if let twoSthree = weightDict[divideThree*2]{
//            print("find 3/2 \(divideThree*2)")
//            coupleCnt += 1
//        }
//
//        //4-2 의 경우
//        let divideFour = w/4
//        if let twoSthree = weightDict[divideFour*2]{
//            print("find 4/2 \(divideFour*2)")
//            coupleCnt += 1
//        }
//        //4-3 의 경우
//        if let twoSthree = weightDict[divideFour*3]{
//            print("find 4/3 \(divideFour*3)")
//            coupleCnt += 1
//        }
    }
    
    return Int64(coupleCnt)
}
//print(solutionB([100,180,360,100,270]))
//print(solutionB([100,100,100,100,100]))
print(solutionB([100,400]))
