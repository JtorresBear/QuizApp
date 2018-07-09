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
    // Just Initializng var's to start the game.
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
        
        //This while loop keeps creating arrays until it is fully random with no
        // repeating elements.
        while(!noRepeatingRandoms(array: gameIndexes))
        {
            gameIndexes = makeRandomArray(sizeOfArray: numOfRounds)
        }
        //starts the first value of the game index so it displays correctly
        self.qAndAs(numIndex: gameIndex)
    }
    
    
    // this function pushes the index so that we can get our next set of questions and answers.
    func nextRound()
    {
        
        gameIndex += 1
        //should set new questions and answers
        self.qAndAs(numIndex: gameIndexes[gameIndex])
    }
    
    // this function resets the variables to display new questions and answwers
    func qAndAs (numIndex: Int)
    {
        question = gameManager.getQuestion(from: gameIndexes[gameIndex])
        optionOne = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 0)
        optionTwo = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 1)
        optionThree = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 2)
        optionFour = gameManager.getPossibleAnswers(from: gameIndexes[gameIndex], and: 3)
    }
    
    // this function takes an integer that is passed from the view controller
    // when the method is called. the integer corresponds to see if the
    // correct answer equals the givenAnswer
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
    
    //this function creates a random array when ever its called and returns an array.
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
