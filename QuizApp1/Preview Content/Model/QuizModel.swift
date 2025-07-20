//
//  QuizModel.swift
//  QuizApp1
//
//  Created by Rachit Sharma on 20/07/2025.
//


import Foundation
struct QuizModel{
    var questions:[questionModel]
}

struct questionModel : Identifiable{
    let id = UUID()
    var prompt:String
    var choices:[String]
    var answer:String
}
extension QuizModel{
    static var mockdata = QuizModel(questions: questionModel.mockQuiz)
}

extension questionModel{
    static  var mockQuiz:[questionModel] = [
        questionModel(prompt: "What is the main function of a View Model in MVVM Architecture?", choices: ["Handle Ui rendering directley", "Manage Business logic for the view", " Store User preferences", "Perform Network requests directley"], answer: "Manage Business logic for the view"),
        questionModel(prompt: "Which of the following is NOT a type of variable in Swift?", choices: ["Constant", "Mutable", "Local", "Global"], answer: "Global"),
        questionModel(prompt: "What is the correct syntax to print a message in Swift?", choices: ["print(\"Hello, World!\")", "System.out.println(\"Hello, World!\")", "console.log(\"Hello, World!\")", "msgbox(\"Hello, World!\")"], answer: "print(\"Hello, World!\")"),
        questionModel(prompt: "What is the purpose of the 'guard' statement in Swift?", choices: ["To handle errors", "To ensure that a condition is met", "To declare a variable as optional", "To loop through a collection"], answer: "To ensure that a condition is met before proceeding")
    ]
}
