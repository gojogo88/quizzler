//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber: Int = 0  //will keep track of the state of the app/question
    var score: Int = 0
    
    //UI elements from the storyboard
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            
            pickedAnswer = true
            
        } else if sender.tag == 2 {
            
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
      
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber < 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        
        } else {
            
            updateUI()
            
            let alert = UIAlertController(title: "Awesome! You got \(score) out of 13", message: "You've finished all the quesions. Would you like to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.startOver()
            })
            
            let stopAction = UIAlertAction(title: "Cancel", style: .default, handler: { (<#UIAlertAction#>) in
                <#code#>
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            print("You've got it")
            score += 1
            
            
        } else {
            
            let alert = UIAlertController(title: "Wrong answer!", message: "Sorry, you got it wrong", preferredStyle: .alert)
            
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
                
                self.nextQuestion()
            })
            
            alert.addAction(continueAction)
            
            present(alert, animated: true, completion: nil)
            
            print("wrong")
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        
        nextQuestion()
        
        score = 0
       scoreLabel.text = "Score: \(questionNumber)"
        
    }
    

    
}
