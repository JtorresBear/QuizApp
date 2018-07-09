//
//  ViewController.swift
//  new Quiz app
//
//  Created by Juan Torres on 7/8/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    //Starts a new fresh game.
    var game = TheGame()
    
    @IBOutlet weak var questionarea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Displays Just the startGameButton
        hideOrShowQuestionsAndOptions(hide: true)
        nextQuestion.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }
    
    @IBAction func startGame(_ sender: Any)
    {
        if(game.firstGame){
            
            showTheGame()
            hideOrShowQuestionsAndOptions(hide: false)
            
        }
        else
        {
            game = TheGame()
            showTheGame()
            hideOrShowQuestionsAndOptions(hide: false)
            enableButtons(enabled: true)
        }
        
        
    }
    
    
    @IBAction func checkAnswer(_ sender: UIButton)
    {
        enableButtons(enabled: false)
        switch sender
        {
        case optionOne: game.isCorrect = game.checkAnswer(givenAnswer: 0)
        case optionTwo: game.isCorrect = game.checkAnswer(givenAnswer: 1)
        case optionThree: game.isCorrect = game.checkAnswer(givenAnswer: 2)
        case optionFour: game.isCorrect = game.checkAnswer(givenAnswer: 3)
            
        default: question.text = "GAME OVER"
        }
        
        if(game.isCorrect)
        {
            question.text = "Great Job You're Right!"
        }
        else
        {
            question.text = "WRONG!!!!!!"
        }
        
        if (game.numOfRounds > 0)
        {
            nextQuestion.isHidden = false
        }
        if(game.numOfRounds == 0)
        {
            question.text = "Your Score is \(game.score) out of \(game.gameIndexes.count)"
            hideOrShowQuestionsAndOptions(hide: true)
            question.isHidden = false
            startGameButton.setTitle("New Game?", for: .normal)
            game.score = 0
            game.firstGame = false
            
        }
    }
    
    //hides the next question Button so it cannot be pressed
    @IBAction func nextQuestion(_ sender: Any)
    {
        game.nextRound()
        self.showTheGame()
        nextQuestion.isHidden = true
        enableButtons(enabled: true)
    }
    
    func enableButtons(enabled: Bool)
    {
        optionOne.isEnabled = enabled
        optionTwo.isEnabled = enabled
        optionThree.isEnabled = enabled
        optionFour.isEnabled = enabled
    }
    
    
    
    
    
    
    
    
    
    
    func hideOrShowQuestionsAndOptions(hide: Bool)
    {
        question.isHidden = hide
        optionOne.isHidden = hide
        optionTwo.isHidden = hide
        optionThree.isHidden = hide
        optionFour.isHidden = hide
        startGameButton.isHidden = !hide
    }
    
    func showTheGame()
    {
        question.text = game.gameManager.getQuestion(from: game.gameIndexes[game.gameIndex])
        optionOne.setTitle(game.gameManager.getPossibleAnswers(from: game.gameIndexes[game.gameIndex], and: 0), for: .normal)
        optionTwo.setTitle(game.gameManager.getPossibleAnswers(from: game.gameIndexes[game.gameIndex], and: 1), for: .normal)
        optionThree.setTitle(game.gameManager.getPossibleAnswers(from: game.gameIndexes[game.gameIndex], and: 2), for: .normal)
        optionFour.setTitle(game.gameManager.getPossibleAnswers(from: game.gameIndexes[game.gameIndex], and: 3), for: .normal)
    }


}

