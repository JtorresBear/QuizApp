//
//  GameManager.swift
//  new Quiz app
//
//  Created by Juan Torres on 7/8/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation
import GameKit

class GameManager
{
    var questionsAndAnswers = QuestionsAndAnswers()
    var gameQuestions: [String]
    var gameAnswers: [[String]]
    var gameCorrectAnswers: [Int]
    
    
    init()
    {
        gameQuestions = questionsAndAnswers.questions
        gameAnswers = questionsAndAnswers.possibleAnswers
        gameCorrectAnswers = questionsAndAnswers.answerIndexes
    }
    
    //returns a string but is only limited to the question
    func getQuestion(from thisNumber: Int) -> String
    {
        return gameQuestions[thisNumber]
    }
    //returns possible answers. the paramaters help navigate through the double array matrix
    func getPossibleAnswers(from answerArray: Int, and answerOption: Int) -> String
    {
        return gameAnswers[answerArray][answerOption]
    }
    
    // this gets the correct answer index.
    func getCorrectAnswer(from answerIndex: Int) -> Int
    {
        return gameCorrectAnswers[answerIndex]
    }
    
}
