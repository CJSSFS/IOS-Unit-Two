//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by CJ on 4/26/19.
//  Copyright © 2019 CJ. All rights reserved.
//

import UIKit
var questionIndex = 0
class QuestionViewController: UIViewController {

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton1: UIButton!
        @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var questionProgressView: UISlider!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    var questions: [Question] = [
        Question(text: "Which food do you like the most", type: .single, answers: [
            Answer(text: "Steak", type: .dog),
            Answer (text: "Fish", type: .cat),
            Answer (text: "Shrimp", type: .rabbit),
            Answer (text: "Chicken", type: .turtle),]),
                 
    Question(text: "Which activities do you enjoy?", type: .multiple, answers: [
                    Answer (text: "Swimming", type: .turtle),
                    Answer (text: "Sleeping", type: .cat),
                    Answer (text: "Walking" , type: .dog),
                    Answer (text: "Running", type: .rabbit)]),
        Question (text: "How much do you enjoy car rides?", type: .ranged, answers: [
                    Answer (text: "I dislike them", type: .cat),
                    Answer (text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle)])
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateUI(){
        
        singleStackView.isHidden = true
        
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question \(questionIndex+1)"
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
            
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateSingleStack(using: currentAnswers)
        }
}
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        
    }
    func updateRangedStack(using answers:[Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count {
        updateUI()
        }else{
            performSegue(withIdentifier:"ResultsSegue", sender: nil)
        }
    }
    
    var answercChosen: [Answer] = []
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1: answercChosen.append(currentAnswers[0])
        
        case singleButton2: answercChosen.append(currentAnswers[1])
        
        case singleButton3: answercChosen.append(currentAnswers[2])
        
        case singleButton4: answercChosen.append(currentAnswers[3])
            
        default:
            break
        }
        nextQuestion()
    }
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    @IBAction func multipleAnswerButtoPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn {
            answercChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answercChosen.append(currentAnswers[1])
            
        }
        if multiSwitch3.isOn {
            answercChosen.append(currentAnswers[2])
            
        }
        if multiSwitch4.isOn {
            answercChosen.append(currentAnswers[3])
            
        }

        
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float (currentAnswers.count - 1)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ResultsSegue"{
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answercChosen
        }
    }
}

