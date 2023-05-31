//:> 연습문제 숫자 짝꿍
/*:>
Lv.1
 */


import Foundation

////: 🌱solutionA (73.7%) 시간 초과
func solutionA(_ X:String, _ Y:String) -> String {
    
    var x = X.enumerated().sorted { first, second in
        first.element < second.element
    }
    var y = Y.enumerated().sorted { first, second in
        first.element < second.element
    }
//    var x = X.enumerated()
//    var y = Y.enumerated()
    
    var pairNums: [Int] = []
    
    for i in 0..<x.count{
        
        if let idx = y.firstIndex(where: {$0.element == x[i].element}){
        
            print("pair! \(x[i].element)")
            pairNums.append(Int(x[i].element.description)!)
            
            y.remove(at: idx)
            
            print("x \(x) \ny \(y)")
        }
    }
    
    
    var pairResult = pairNums.sorted(by: >)
    var result = ""
    if pairResult.count > 0{
        pairResult.map { v in
            if result == "0" && v == 0{
                result = "0"
            }else{
                result += String(v)
            }
        }
        
    }else{
        result = "-1"
    }
    
    
    return result
}


//print(solutionA("100", "2345"))
//print(solutionA("12321", "42531"))
//print(solutionA("100", "203045"))

//: 🌱solutionB (94.7%)->(100%)
///시간초과(1문제 타임아웃) --> 다시 실행해보니까 통과됨...뭐지...
func solutionB(_ X:String, _ Y:String) -> String {
    
    var xDict: [Int:Int] = [:]
    var yDict: [Int:Int] = [:]
    var resultDict: [Int:Int] = [:]
    
    var pairNums: [Int] = []
    
    for x in X.enumerated(){
        let xValue = Int(x.element.description)
        xDict[xValue!] = (xDict[xValue!] ?? 0) + 1
    }
    
    for y in Y.enumerated(){
        let yValue = Int(y.element.description)
        yDict[yValue!] = (yDict[yValue!] ?? 0) + 1
    }
    
    print("xDict \(xDict)\nyDict\(yDict)")
    
    let minDict = xDict.count > yDict.count ? yDict : xDict
    
    for d in minDict{
        resultDict[d.key] = min((xDict[d.key] ?? 0), (yDict[d.key] ?? 0))
    }
    
    print("resultDict \(resultDict)")
    
    var result = ""
    var resultArr:[Int] = []
    
    for d in resultDict{
        if d.value > 0{
            for _ in 0..<d.value{
                resultArr.append(d.key)
            }
        }
    }
    print("resultArr \(resultArr)")
    resultArr.sort(by: >)
    
    if resultArr.count > 0{
        for r in resultArr{
            if result == "0" && r == 0{
                result = "0"
            }else{
                result += String(r)
            }
        }
    }else{
        result = "-1"
    }
    
    
    return result
}


//print(solutionB("100", "2345"))
//print(solutionB("12321", "42531"))
//print(solutionB("100", "203045"))
//print(solutionB("12321", "42531"))
//print(solutionB("5525", "1255"))

//: 🌱solutionC (73.7%)
//타임아웃
func solutionC(_ X:String, _ Y:String) -> String {
    
    var x = X.enumerated().sorted { first, second in
        first.element < second.element
    }
    var y = Y.enumerated().sorted { first, second in
        first.element < second.element
    }
    
    var pairNums: [Int] = []
    
    while !x.isEmpty && !y.isEmpty{
        let xLast = Int(x.last!.element.description)!
        let yLast = Int(y.last!.element.description)!
        
        if xLast == yLast{
            pairNums.append(xLast)
            x.popLast()
            y.popLast()
        }else if xLast > yLast{
            x.popLast()
        }else{
            y.popLast()
        }
    }

    print("pair \(pairNums)")
    
    var result = ""
    var pairResult = pairNums.sorted(by: >)
    
    
    if pairResult.count > 0{
        pairResult.map { v in
            if result == "0" && v == 0{
                result = "0"
            }else{
                result += String(v)
            }
        }
    }else{
        result = "-1"
    }
    
    return result
}
//print(solutionC("100", "2345"))
//print(solutionC("12321", "42531"))
//print(solutionC("100", "203045"))
//print(solutionC("12321", "42531"))
print(solutionC("5525", "1255"))
//
