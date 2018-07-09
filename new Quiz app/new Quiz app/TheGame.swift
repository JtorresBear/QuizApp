//
//  TheGame.swift
//  new Quiz app
//
//  Created by Juan Torres on 7/8/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation
import GameKit

class TheGame
{
    var gameManager = GameManager()
    var gameIndex: Int
    var numOfRounds: Int
    var score: Int
    var gameIndexes: [Int] = [3]
    var firstGame = true
    var question: String = " "
    var optionOne: String = " "
    var optionTwo: String = " "
    var optionThree: String = " "
    var optionFour: String = " "
    
    var isCorrect:Bool = false
    
    init()
    {
        numOfRounds = gameManager.gameQuestions.count/3
        
        gameIndex = 0
        score = 0
        gameIndexes = makeRandomArray(sizeOfArray: numOfRounds)
        while(!noRepeatingRandoms(array: gameIndexes))
        {
            gameIndexes = makeRandomArray(sizeOfArray: numOfRounds)
        }
        
        self.qAndAs(numIndex: gameIndex)
    }
    
    
    func nextRound()
    {
        
        gameIndex += 1
        //should set new questions and answers
        self.qAndAs(numIndex: gameIndexes[gameIndex])
    }
    
    func qAndAs (numIndex: Int)
    {
        question = gameManager.getQuestion(from: gameIndexes[gameIndex])
        optionOne = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 0)
        optionTwo = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 1)
        optionThree = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 2)
        optionFour = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 3)
    }
    
    func checkAnswer(givenAnswer: Int) -> Bool
    {
        numOfRounds = numOfRounds - 1
        if(givenAnswer == gameManager.gameCorrectAnswers[gameIndexes[gameIndex]])
        {
            score = score + 1
            return true
        }
        else {return false}
        
    }
    
    // checks for repeating elements in an array
    func noRepeatingRandoms(array: [Int]) -> Bool
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
            
            
            index += 1
            
        }
        
        
        
        
        return true
    }
    
    
    func makeRandomArray(sizeOfArray: Int) -> [Int]
    {
        var randomArray: [Int] = [GKRandomSource.sharedRandom().nextInt(upperBound: gameManager.gameQuestions.count)]
        var temp = 1
        
        while(temp < sizeOfArray)
        {
            randomArray.append(GKRandomSource.sharedRandom().nextInt(upperBound: gameManager.gameQuestions.count))
            temp += 1
        }
        
        
        return randomArray
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
