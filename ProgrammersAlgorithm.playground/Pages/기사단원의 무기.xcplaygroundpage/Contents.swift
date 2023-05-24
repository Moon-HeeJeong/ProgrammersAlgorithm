//:> 연습문제 기사단원의 무기
/*:>
Lv.1
 */


import Foundation

//: 🌱solutionA (66.7%)
//시간초과
func solutionA(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    var divisorCnts:[Int] = []
    
    //약수의 개수 구하기
    for i in 1..<number+1{
        var divisorCnt = 0
        
        for j in 1..<i+1{
            if (i%j == 0){
                divisorCnt += 1
            }
        }
        divisorCnts.append(divisorCnt)
    }
    print("diviosr cnts \(divisorCnts)")
    
    //공격력이 제한수치를 넘으면 제한 값으로 변경
    for i in 0..<divisorCnts.count{
        if divisorCnts[i] > limit{
            divisorCnts[i] = power
        }
    }
    
    print("diviosr cnts limit\(divisorCnts)")
    return divisorCnts.reduce(0, +)
}


//print(solutionA(5,3,2))
//print(solutionA(10,3,2))

//: 🌱solutionB (55.7%)
//for문을 /2 수 만큼만 돌도록 줄임
func solutionB(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    
    var divisorCnts:[Int] = []
    //약수의 개수 구하기
    for i in 1..<number+1{
        divisorCnts.append(i != 1 ? (1...i/2).filter({i % $0 == 0}).count : 1)
    }
    print("diviosr cnts \(divisorCnts)")
    
    //공격력이 제한수치를 넘으면 제한 값으로 변경
    for i in 0..<divisorCnts.count{
        if divisorCnts[i] > limit{
            divisorCnts[i] = power
        }
    }
    
    print("diviosr cnts limit\(divisorCnts)")
    return divisorCnts.reduce(0, +)
}

//: 🌱solutionC (100%)
//코드 참고함..! for문을 제곱근의 수 만큼만 돌도록 줄임 그리고 quotient 변수로 더 추가해야하는 수 체크
func solutionC(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    var divisorCnts:[Int] = []
    
    //약수의 개수 구하기
    for i in 1..<number+1{
        var divisorCnt = 0
        
        var squrtValue = Int(sqrt(Double(i)))
        print("i \(i) squrtValue \(squrtValue)")
        for j in 1..<squrtValue+1{
            
            if (i%j == 0){
                divisorCnt += 1
                
                let quotient = i/j
                if quotient != j{
                    divisorCnt += 1
                }
                
            }
        }
        divisorCnts.append(divisorCnt)
    }
    print("diviosr cnts \(divisorCnts)")
    
    //공격력이 제한수치를 넘으면 제한 값으로 변경
    for i in 0..<divisorCnts.count{
        if divisorCnts[i] > limit{
            divisorCnts[i] = power
        }
    }
    
    return divisorCnts.reduce(0, +)
}
//print(solutionC(5,3,2))
print(solutionC(10,3,2))
