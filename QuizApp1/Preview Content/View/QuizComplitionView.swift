//
//  QuizComplitionView.swift
//  QuizApp1
//
//  Created by Rachit Sharma on 20/07/2025.
//



import SwiftUI

struct QuizCompletionView: View {
    @Environment(QuizViewModel.self) var viewmodel
    @State var showresulstview: Bool = false
    var body: some View {
        VStack(spacing: 15){
            Text("Congratulations you've completed the quiz!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("click below to view your results")
                .foregroundStyle(.gray)
         
            Button(action: {
                showresulstview.toggle()
            }, label: {
                Text("View Results")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            })
            .sheet(isPresented: $showresulstview){
                ShowResultView()
                    .environment(viewmodel)
                    .presentationDetents([.medium])
            }
            
            Button(action: {
                viewmodel.resetquiz()
            }, label: {
                Text("Start Over")
                    
            })
            .foregroundStyle(.blue)
            .fontWeight(.semibold)
        }
       
    }
}

#Preview {
    QuizCompletionView()
        .environment(QuizViewModel())
}
