//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dara Khadjehnouri on 2022-04-14.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var title: String
    var choices: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.title = q
        self.choices = a
        self.correctAnswer = correctAnswer
    }
}
