//
//  Question.swift
//  Quizzler
//
//  Created by Jonathan Go on 2017/08/08.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

//going to be used as a structure for every question
class Question {
    
    //properties
    let questionText: String
    let answer: Bool
    
    //events
    init(text: String, correctAnswer: Bool) {
        
        questionText = text
        answer = correctAnswer
    }
    
    
    
}
