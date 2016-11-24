//: Playground - noun: a place where people can play

import UIKit

func getSubset(set: [Int], index:Int) -> [[Int]]{
    var allsubsets = [[Int]]()
    if set.count == index{
        allsubsets = [[Int]]()
    } else {
        allsubsets = getSubset(set: set, index: index + 1)
        var item:Int = set[index]
        
        var moresubsets = [[Int]]()
        
        for subset in allsubsets{
            var newsubset = [Int]()
            newsubset += subset
            newsubset.append(item)
            moresubsets.append(newsubset)
        }
        allsubsets += moresubsets
        
    }
    return allsubsets
    
}

getSubset(set: [1,2,3,4], index: 0)

func getSubset_recursive(nums:[Int]) -> [[Int]]{
    var result = [[Int]]()
    var next = [Int]()
    
    for i in nums{
        for j in result{
            next = next + j + [i]
        }
        result = result + [next]
        next = []
    }
    return result
}


getSubset_recursive(nums: [1,2,3])









