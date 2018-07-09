//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: [Previous](@previous)

import Foundation
import GameKit


//: [Next](@next)

func norepeatingRandoms(array: [Int]) -> Bool
{
    var index = 0
    
    
    while(index < array.count )
    {
        var temp = index + 1
        while(temp < array.count)
        {
            if(array[index] == array[temp])
            {
                return false
            }
            temp += 1
        }
        
        
        //print(index)
        index += 1
        
    }
    
    
    
    
    return true
}

var anArray = [2,4,1,6]
print("help")
print(norepeatingRandoms(array: anArray))

print("help")


func makeRandomArray(sizeOfArray: Int) -> [Int]
{
    var randomArray: [Int] = [GKRandomSource.sharedRandom().nextInt(upperBound: anArray.count)]
    var temp = 1
    
    while(temp < sizeOfArray)
    {
        randomArray.append(GKRandomSource.sharedRandom().nextInt(upperBound: anArray.count))
        temp += 1
    }
    
    
    return randomArray
}
anArray = makeRandomArray(sizeOfArray: 5)

while(!norepeatingRandoms(array: anArray))
{
    anArray = makeRandomArray(sizeOfArray: 5)
}
anArray
print("working So000 Far")


