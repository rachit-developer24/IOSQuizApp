//
//  QuizView.swift
//  QuizApp1
//
//  Created by Rachit Sharma on 20/07/2025.
//


import SwiftUI
struct QuizView: View {
    @State var selectedanswer : String?
    
    @State var viewmodel = QuizViewModel()
    var body: some View {
        if viewmodel.quizcompletionView{
            QuizCompletionView()
                .environment(viewmodel)
            
        }else {
            VStack(alignment:.leading,spacing: 10){
                Text(viewmodel.currentquestion.prompt)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text("Select an Answer below")
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
            }
            .padding(.horizontal)
            VStack(alignment:.leading){
                Text("\(viewmodel.currentquestionindex + 1) / \(viewmodel.quiz.questions.count)")
                    .fontWeight(.bold)
                    .padding(.top,30)
                    .padding(.horizontal)
                Divider()
                
            }
            VStack{
                ForEach(viewmodel.currentquestion.choices,id: \.self){
                    choices in
                    Button(action: {
                        self.selectedanswer = choices
                    }, label: {
                        Text(choices)
                            .padding(.horizontal)
                            .foregroundStyle(Color.black)
                            .frame(width: 360, height: 50, alignment: .leading)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke( selectedanswer == choices ? Color.blue : Color.gray, lineWidth: selectedanswer == choices ? 2 : 1))
                        
                    })
                    
                    
                    
                }
                
                Spacer()
                Button(action: {
                    guard let selectedanswer  else{return}
                    viewmodel.nextquestion(selectedanswer)
                }, label: {
                    Text("Submit")
                })
                .disabled(selectedanswer == nil)
                .opacity(selectedanswer == nil ? 0.5 : 1)
                .foregroundStyle(.white)
                .frame(width: 360, height: 50, alignment: .center)
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
            }
        }
    }
}
    #Preview {
        QuizView()
    }
    

