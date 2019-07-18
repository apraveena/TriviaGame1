//
//  ViewController.swift
//  TriviaGame1
//
//  Created by Spur IQ on 7/17/19.
//  Copyright © 2019 Praveena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questions = ["What goes up when rain comes down?",
                     "What loses it's head in the morning and gets it back in the night?",
                     "What has a mouth but cannot eat, has a bed but cannot sleep?",
                     "You will buy me to eat but never eat me. What am I?"]
    var ans = ["Umbrella", "Pillow", "River", "Plate"]
    var qnNum = 0
    var restart = false
    
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var endOfGameMsgLabel: UILabel!
    @IBOutlet weak var answerCheckLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[qnNum]
    }

    @IBAction func nextButtonClick(_ sender: Any) {
        //If restart button is clicked, then reset the screen.
        if (restart == true) {
            qnNum = 0
            restart = false
            answerCheckLabel.text = ""
            questionLabel.text = ""
            answerTextField.text = ""
            endOfGameMsgLabel.text = ""
            score = 0
            nextButton.setTitle("Check", for: .normal)
            questionLabel.text = questions[qnNum]
            return
        }
        
        //In game mode, if answer is not entered, then exit
        if(answerTextField.text == ""){
            answerCheckLabel.text = "Please enter an answer"
            return
        }
        
        //If the entered answer is the correct answer, show correct message and increase score.
        let ansFromUser = answerTextField.text
        let corrAns = ans[qnNum]
        if (ansFromUser!.caseInsensitiveCompare(corrAns) == .orderedSame) {
            answerCheckLabel.text = "Correct."
            score += 1
        } else {
            answerCheckLabel.text = "Incorrect.\n Correct answer is: \(corrAns)"
        }
        
        //Show current score
        scoreLabel.text = "Score: \(String(score))"
        
        //Once the answer is processed, move on to next question
        qnNum += 1
        //If this is the last question, give approprite messages and set the button title to "Restart"
        //set the restart boolean to true.
        if(qnNum >= questions.count) {
            if(score > questions.count/2) {
               endOfGameMsgLabel.text = "Game over. Well done.\nClick Restart to play again."
            } else {
               endOfGameMsgLabel.text = "Game over. Better luck next time.\nClick Restart to play again."
            }
            nextButton.setTitle("Restart", for: .normal)
            answerTextField.text = ""
            restart = true
        } else {
            //If still in game mode, then display next question, clear the text field.
            questionLabel.text = questions[qnNum]
            answerTextField.text = ""
            restart = false
        }
    }
}

