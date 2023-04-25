//:> 2019 카카오 개발자 겨울 인턴십
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA
//테스트는 통과인데 채점 누르면 무슨.. illegal instruction (core dumped)) 만 잔뜩 뜬다
func solutionA(_ board:[[Int]], _ moves:[Int]) -> Int {
    var tempBoard = board
    var pickedDolls: [Int] =  []
    var isPicked: Bool = false
    var popCnt: Int = 0
    
    for m in moves{
//        print("\n== currnt moves \(m)")
        
//        var i = 0
        isPicked = false
        
        for i in 0..<tempBoard.count{
            if !isPicked{
                let b = tempBoard[i]
                
                let currentDoll = b[m-1]
                
                if currentDoll == 0 {
                    if i == b.count - 1{ //인형이 없는 경우
                        isPicked = true
                    }
                }else{
                    pickedDolls.append(currentDoll)
                    tempBoard[i][m-1] = 0
                    isPicked = true
                }
            }
        }
        
//        while !isPicked{
//            let b = tempBoard[i]
////            print("==== currnt tempBoard \(b)")
//
//            let currentDoll = b[m-1]
////            print("====== currnt doll \(currentDoll)")
//
//            if currentDoll == 0 {
//                if i == b.count - 1{ //인형이 없는 경우
//                    isPicked = true
//                }
//            }else{
//                pickedDolls.append(currentDoll)
//                tempBoard[i][m-1] = 0
//                isPicked = true
//            }
//            i += 1
//        }
    }
    print("picked \(pickedDolls)")
    

    var firstIdx = pickedDolls.count-1
    var secondIdx = pickedDolls.count-2
    
    for i in 0..<pickedDolls.count-1{
        
        guard i <= pickedDolls.count else{
            return popCnt
        }
        firstIdx -= i
        secondIdx -= i
        
        print("i \(i) compare \(firstIdx) : \(secondIdx) at \(pickedDolls)")
   
            if pickedDolls[firstIdx] == pickedDolls[secondIdx]{
                
                //            print("pop \(pickedDolls[firstIdx]) value")
                pickedDolls.remove(at: firstIdx)
                pickedDolls.remove(at: secondIdx)
                
                firstIdx += 2
                secondIdx += 2
                
                popCnt += 2
                print("result \(pickedDolls)")
                
            }
        
    }
    
    
    return popCnt
}

//print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))

//: 🌱solutionB (100%)
//solutionA에서 뽑기에서 뽑힌 인형들을 배열에 다 집어넣고 나중에 삭제했는데
//solutionB에서는 넣으면서 바로바로 배열 마지막 값과 비교하는 방식으로 함
func solutionB(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var tempBoard = board
        var pickedDolls: [Int] =  []
        var isPicked: Bool = false
        var popCnt: Int = 0
        
        for m in moves{
            
            isPicked = false
            
            for i in 0..<tempBoard.count{
                if !isPicked{
                    let b = tempBoard[i]
                    
                    let currentDoll = b[m-1]
                    
                    if currentDoll == 0 {
                        if i == b.count - 1{ //인형이 없는 경우
                            isPicked = true
                        }
                    }else{
                        pickedDolls.append(currentDoll)
                        tempBoard[i][m-1] = 0
                        isPicked = true
                        
                        let pickDollsCnt = pickedDolls.count
                        
                        if pickDollsCnt > 1{
                            if pickedDolls[pickDollsCnt-1] == pickedDolls[pickDollsCnt-2]{
                                pickedDolls.remove(at: pickDollsCnt-1)
                                pickedDolls.remove(at: pickDollsCnt-2)
                                popCnt += 2
                            }
                        }
                    }
                }
            }
        }
        
         return popCnt
    
}

//: 🌱solutionC (100%)
//solutionB 정리한 모습
//PICK 된 값이 배열 마지막 값과 같다면 굳이 배열에 넣지 않고 배열 마지막 값만 삭제해 준다
//배열은 스택 구조이므로 removeLast를 이용하여 지워준다.
func solutionC(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var tempBoard = board
    var pickedDolls: [Int] =  []
    var isPicked: Bool = false
    var popCnt: Int = 0
    
    for m in moves{
        
        isPicked = false
        
        for i in 0..<tempBoard.count{
            if !isPicked{
                let b = tempBoard[i]
                
                let currentDoll = b[m-1]
                
                if currentDoll == 0 {
                    if i == b.count - 1{ //인형이 없는 경우
                        isPicked = true
                    }
                }else{
                    tempBoard[i][m-1] = 0
                    isPicked = true
                    
                    if pickedDolls.last == currentDoll{
                        pickedDolls.removeLast()
                        popCnt += 2
                    }else{
                        pickedDolls.append(currentDoll)
                    }
                    print("picked \(pickedDolls)")
                }
            }
        }
    }
    print("close picked \(pickedDolls)")
    
    return popCnt
}

print(solutionC([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
