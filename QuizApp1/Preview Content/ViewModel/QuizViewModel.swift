//
//  QuizViewModel.swift
//  QuizApp1
//
//  Created by Rachit Sharma on 20/07/2025.
//
import Foundation
import Observation
@Observable
class QuizViewModel {
    var quiz :QuizModel
    var currentquestionindex :Int = 0
    var correctanswercount :Int = 0
    var quizcompletionView = false
    var currentquestion:questionModel{
        return quiz.questions[currentquestionindex]
    }
    var wronganswercount :Int {
        return quiz.questions.count - correctanswercount
    }
    var totalpercentage :Double {
        return Double(correctanswercount)/Double(quiz.questions.count)*100
    }
    init(){
        self .quiz = QuizModel.mockdata
    }
    
    
    func nextquestion(_ answer:String){
        if answer == currentquestion.answer{
            correctanswercount += 1
        }
        if currentquestionindex < quiz.questions.count-1{
            currentquestionindex += 1
        }
        else{
            quizcompletionView = true
        }
    }
    
    func resetquiz(){
        currentquestionindex = 0
        correctanswercount = 0
        quizcompletionView = false
    }
}
