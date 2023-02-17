//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionIndex = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        updateUI()
    }
    
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIndex + 1)
        let question = allQuestions.list[questionIndex]
        questionLabel.text = question.questionText
        progressLabel.text = "\(questionIndex+1) / 13"
        scoreLabel.text = "Score: \(score)"
        nextQuestion()
    }
    
    func nextQuestion() {
        if questionIndex <= 11 {
            questionIndex += 1
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the question, do you want to start over?", preferredStyle: .alert)
            
            let restartaction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartaction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let question = allQuestions.list[questionIndex]
        if (pickedAnswer == question.answer) {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        updateUI()
    }
}
