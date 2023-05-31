//
//  ContentView.swift
//  kahoot quiz
//
//  Created by T Krobot on 27/5/23.
//

import SwiftUI

struct ContentView: View {
    var questions = [Questions(question: "What is the chemical symbol for the element gold?", option1: "Au",
                               option2: "Hg",
                               option3: "Zn",
                               option4: "K"),
                     Questions(question: "Which country won the FIFA World Cup in 2018?",
                               option1: "Argentina",
                               option2: "France",
                               option3: "Brazil",
                               option4: "Germany")]
    
    @State private var showAlert = false
    @State private var currentIndex = 0
    @State private var correctAnswer = false
    @State private var showSheet = false
    @State private var score = 0
    
    var body: some View {
        ZStack{
            VStack {
                Text(questions[currentIndex].question)
                    .padding()
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                HStack{
                    Button{
                        correctAnswer = true
                        showAlert = true
                        score += 1
                        print("Button tapped!")
                    } label: {
                        Text(questions[currentIndex].option1)
                            .frame(width: 120, height: 120)
                            .padding()
                            .font(.system(size: 25))
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                    }
                    Button{
                        correctAnswer = true
                        showAlert = true
                        print("Button tapped!")
                    } label: {
                        Text(questions[currentIndex].option2)
                            .frame(width: 120, height: 120)
                            .padding()
                            .font(.system(size: 25))
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                    }
                }
                HStack{
                    Button{
                        correctAnswer = false
                        showAlert = true
                        print("Button tapped!")
                    } label: {
                        Text(questions[currentIndex].option3)
                            .frame(width: 120, height: 120)
                            .padding()
                            .font(.system(size: 25))
                            .background(.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                    }
                    Button{
                        correctAnswer = false
                        showAlert = true
                        print("Button tapped!")
                    } label: {
                        Text(questions[currentIndex].option4)
                            .frame(width: 120, height: 120)
                            .padding()
                            .font(.system(size: 25))
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        
                    }
                }
            }
            .alert(correctAnswer ? "Correct" : "Incorrect", isPresented: $showAlert){
                
                Button("Next question") {
                    currentIndex += 1
                    if currentIndex == questions.count{
                        showSheet = true
                        currentIndex = 0
                    }
                }
                
                
            }
            .sheet(isPresented: $showSheet){
                scoreView(score: score, total: questions.count)
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
