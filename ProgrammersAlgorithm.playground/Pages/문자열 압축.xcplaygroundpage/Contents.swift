//:> 연습문제 문자열 압축
/*:>
 Lv.2
 */


import Foundation

//: 🌱solution (62%) -> (92%)
//62퍼 2,3,6,11,12,14,15,17, 26,27,28 케이스 실패
//92퍼 3,4 타임아웃 // ?? 수정한게 거의없는것 같은데..
func solution(_ s:String) -> Int {
    
    var zipStr: String = ""
    var s = s
    
    
    for i in 0..<s.count{
        
        let cutOffset = i+1 //cutRange 크기만큼 자르기
        var newZipStr = ""
        var stackCnt = 1
        var beforeStr = ""
        
        
        
        for j in stride(from: 0, to: s.count, by: cutOffset){
            let start = s.index(s.startIndex, offsetBy: j)
            let end = s.index(s.startIndex, offsetBy: min(cutOffset+j, s.count))

            let cuttingStr = s[start..<end]
            print("cutting \(cuttingStr) stackCnt \(stackCnt) j \(j) s.count \(s.count) cutOffset \(cutOffset)")
//            print("cutting \(cuttingStr) stackCnt \(stackCnt)")
            
            if beforeStr == cuttingStr{
                stackCnt += 1
                
                if j >= s.count - cutOffset{
                    newZipStr += "\(stackCnt)\(cuttingStr)"
                    print("newZipStr \(newZipStr)")
                }
            }else{
                if stackCnt > 1{
                    newZipStr += "\(stackCnt)\(beforeStr)"
                    
                    if j >= s.count - cutOffset{
                        newZipStr += "\(cuttingStr)"
                        print("newZipStr \(newZipStr)")
                    }
                   
                }else{
                    if j >= s.count - cutOffset{
                 
                        if stackCnt > 1{
                            newZipStr += beforeStr
                            newZipStr += "\(stackCnt)\(cuttingStr)"
                           
                        }else{
                            newZipStr += "\(beforeStr)\(cuttingStr)"
                        }
                        
                    }else{
                        newZipStr += beforeStr
                    }
                }
                print("newZipStr \(newZipStr)")
                print("stackCnt reset")
                stackCnt = 1
            }
            beforeStr = String(cuttingStr)
        }
        
        
        if i == 0{
            zipStr = newZipStr
        }else{
            zipStr = zipStr.count > newZipStr.count ? newZipStr : zipStr
        }
        
        print("😀zipzip ::: \(zipStr)")
        
    }
    
    
    
    return zipStr.count
}
//print(solution("ababcdcdababcdcd"))
//print(solution("aabbaccc"))
//print(solution("ababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdab")) 13

//print(solution("aaaaaaaaabaa")) //5
//print(solution("aaaaaaaaaabbbbbbbbbb")) //6
//print(solution("a"))
//print(solution("aaaaa"))
//print(solution("aaaaaaaaaa"))
//print(solution("aaaaaaaaaab"))

//: 🌱solutionB (100%)
//ㅠㅠ
//solution 코드가 타임아웃돼서 그 코드를 정리함
func solutionB(_ s:String) -> Int {
    
    var zipStr: String = ""
    var s = s
    
    for i in 0..<s.count{
        
        let cutOffset = i+1 //cutRange 크기만큼 자르기
        var newZipStr = ""
        var stackCnt = 1
        var beforeStr = ""
        
        for j in stride(from: 0, to: s.count, by: cutOffset){
            let start = s.index(s.startIndex, offsetBy: j)
            let end = s.index(s.startIndex, offsetBy: min(cutOffset+j, s.count))

            let cuttingStr = s[start..<end]
            print("cutting \(cuttingStr) stackCnt \(stackCnt) j \(j) s.count \(s.count) cutOffset \(cutOffset)")
            
            if beforeStr == cuttingStr{
                stackCnt += 1
                
                if j >= s.count - cutOffset{
                    newZipStr += "\(stackCnt)"
                }
            }else{
                if stackCnt > 1{
                    newZipStr += "\(stackCnt)\(beforeStr)"
                }else{
                        newZipStr += beforeStr
                }
                stackCnt = 1
            }
            
            
            if j >= s.count - cutOffset{
                newZipStr += "\(cuttingStr)"
            }
            
            print("newZipStr \(newZipStr)")
            
            beforeStr = String(cuttingStr)
        }
        
        
        if i == 0{
            zipStr = newZipStr
        }else{
            zipStr = zipStr.count > newZipStr.count ? newZipStr : zipStr
        }
        
        print("😀zipzip ::: \(zipStr)")
        
    }
    
    
    
    return zipStr.count
}
//print(solutionB("ababcdcdababcdcd"))
//print(solutionB("aabbaccc"))
//print(solutionB("ababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdabababcdcdab")) 13

print(solutionB("aaaaaaaaabaa")) //5
//print(solutionB("aaaaaaaaaabbbbbbbbbb")) //6
//print(solutionB("a"))
//print(solutionB("aaaaa"))
//print(solutionB("aaaaaaaaaa"))
//print(solutionB("xababcdcdababcdcd"))
