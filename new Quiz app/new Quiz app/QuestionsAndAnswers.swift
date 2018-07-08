//
//  QuestionsAndAnswers.swift
//  new Quiz app
//
//  Created by Juan Torres on 7/8/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation

struct QuestionsAndAnswers
{
    //Array of String Objects to hold the Questions
    let questions: [String] = ["This was the only US President to serve more than two consecutive terms.",
                               "Which of the following countries has the most residents?",
                               "In what year was the United Nations founded?",
                               "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                               "Which nation produces the most oil?",
                               "Which country has most recently won consecutive World Cups in Soccer?",
                               "Which of the following rivers is longest?",
                               "Which city is the oldest?",
                               "Which country was the first to allow women to vote in national elections?",
                               "Which of these countries won the most medals in the 2012 Summer Games?"]
    
    // array of an array of strings to hold the possible questions
    let possibleAnswers: [[String]] = [["George Washington","Franklin D. Roosevelt","Woodrow Wilson","Andrew Jackson"],
                                       ["Nigeria", "Russia", "Iran", "Vietnam"],
                                       ["1918","1919","1945","1954"],
                                       ["Paris","Washington D.C","New York City","Boston"],
                                       ["Iran","Iraq","Brazil","Canada"],
                                       ["Italy","Brazil","Argetina","Spain"],
                                       ["Yangtze","Mississippi", "Congo", "Mekong"],
                                       ["Mexico City", "Cape Town", "San Juan", "Sydney"],
                                       ["Poland", "United States", "Sweden", "Senegal"],
                                       ["France", "Germany", "Japan", "Great Britian"],
                                       ]
    // array of indexes that can point to correct answers
    
    let answerIndexes: [Int] = [2,1,3,3,4,2,2,1,1,4]
    
    // gets the total number of questions to let the app know how many rounds it will go.
    
    func getNumOfQuestions() -> Int
    {
        return questions.count
    }
    
    
    
    
    
    
}
