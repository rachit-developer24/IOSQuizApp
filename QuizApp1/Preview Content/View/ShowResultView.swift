//
//  ShowResultView.swift
//  QuizApp1
//
//  Created by Rachit Sharma on 20/07/2025.
//


import SwiftUI

struct ShowResultView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(QuizViewModel.self) var viewmodel
    var body: some View {
        HStack{
            VStack(alignment: .leading , spacing: 20){
                Text("You Scored")
                    .foregroundStyle(Color(.systemMint))
                Text(String(format: "%.0f%%", viewmodel.totalpercentage))
                    .font(.system(size: 80 , weight: .bold))
                    .foregroundStyle(.white)
                
                
            }
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
               Image(systemName: "xmark.circle.fill")
                    
            })
           
            .foregroundStyle(.white)
            .imageScale(.large)
        }
        .padding(.horizontal)
        .frame(width:
                410, height: 200 , alignment: .leading)
        .background(Color.blue)
        Text("Statistics")
            .padding()
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 410, alignment: .leading)
        VStack{
           HStack{
                Text("Correct Answer")
                   .fontWeight(.semibold)
               Spacer()
               Text("\(viewmodel.correctanswercount) / \(viewmodel.quiz.questions.count)")
              
            }
           .padding(.horizontal)
           .frame(width: 380, height: 60, alignment: .leading)
           .background(Color(.systemGray6))
           .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack{
                Text("Incorret Answer")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(viewmodel.wronganswercount) / \(viewmodel.quiz.questions.count)")
            }
            .padding(.horizontal)
            .frame(width: 380, height: 60, alignment: .leading)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
       
        
    }
}

#Preview {
    ShowResultView()
        .environment(QuizViewModel())
}

