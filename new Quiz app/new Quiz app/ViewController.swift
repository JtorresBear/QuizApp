//
//  ViewController.swift
//  new Quiz app
//
//  Created by Juan Torres on 7/8/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //instance of all the question and answer data
    let questionsAndAnswers = QuestionsAndAnswers()
    
    @IBOutlet weak var questionarea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

