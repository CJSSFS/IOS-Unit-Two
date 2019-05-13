//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by CJ on 5/10/19.
//  Copyright © 2019 CJ. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses:[Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        func calculatePersonalityResult(){
            var frequencyOfAnswers: [AnimalType: Int] = [:]
            let responseTypes = responses.map {$0.type}
            for response in responseTypes {
                frequencyOfAnswers[response]
            }
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
