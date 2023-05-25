//:> 연습문제 달리기 경주
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA (56.3%)
//타임아웃
func solutionA(_ players:[String], _ callings:[String]) -> [String] {
    
    var runnerSequence:[String:Int] = [:]
    
    for i in 0..<players.count {
        runnerSequence[players[i]] = i
    }
    
    for i in 0..<callings.count{
        
        let passingRunner = callings[i]
        
        print("passing \(passingRunner)")
        
        var passedRunner = runnerSequence.filter({$0.value == runnerSequence[passingRunner]! - 1}).keys.first!
        print("passed \(passedRunner)")
        
        runnerSequence[passedRunner]! += 1
        runnerSequence[passingRunner]! -= 1
        
        print("current \(runnerSequence)")
    }

    return runnerSequence.sorted(by: {$0.value < $1.value}).map({$0.key})
}
//print(solutionA(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))

//: 🌱solutionB (100%)
//players 배열을 하나 더 만들어서 한다 players, runnerSequence 모두 스왑하는 방식으로
func solutionB(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var runnerSequence:[String:Int] = [:]
    
    for i in 0..<players.count {
        runnerSequence[players[i]] = i
    }
    
    for i in 0..<callings.count{
    print("runnerSequence \(runnerSequence)")
        var passingRunner = callings[i]
        var passingRunnerIdx = runnerSequence[passingRunner]
        
        let passedRunner = players[passingRunnerIdx! - 1]
        let passedRunnerIdx = runnerSequence[passedRunner]
//        var passedRunner = runnerSequence.filter({$0.value == passingRunnerIdx! - 1}).first
//        var passedRunnerIdx = runnerSequence[passedRunner]
        print("passingRunner \(passingRunner) idx \(passingRunnerIdx) passedRunner \(passedRunner) idx \(passedRunnerIdx)")
        
        players[passedRunnerIdx!] = passingRunner
        players[passingRunnerIdx!] = passedRunner
        
        runnerSequence[passingRunner] = passedRunnerIdx
        runnerSequence[passedRunner] = passingRunnerIdx
        
        
        
    }
    

    return runnerSequence.sorted(by: {$0.value < $1.value}).map({$0.key})
}
print(solutionB(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
