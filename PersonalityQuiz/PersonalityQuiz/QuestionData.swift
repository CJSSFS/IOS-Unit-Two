//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by CJ on 4/29/19.
//  Copyright © 2019 CJ. All rights reserved.
//

import Foundation
struct Question {
    var text : String
    var type: ResponseType
    var answers:[Answer]
}
enum ResponseType{
    case single, multiple, ranged
}
struct Answer {
    var text:String
    var type: AnimalType
}
enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String{
        switch self {
        case .dog:
            return "You are increiblu outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love soft things."
        case .turtle:
            return "You love hard things"
        }
}
}
