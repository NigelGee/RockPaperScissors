//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nigel Gee on 18/10/2019.
//  Copyright © 2019 Nigel Gee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var ramdomQuestion = Int.random(in: 0...2)
    @State private var score = 0
    @State private var appScore = 0
    @State private var count = 0
    @State private var title = ""
    @State private var message = ""
    var iconArray = ["⛰" , "📄", "✄"]
    var nameArray = ["Rock", "Paper", "Scissors"]
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Start"), Color("Middle"), Color("End")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Your Score: \(score)")
                        
                        Spacer()
                        
                        Text("System Score: \(appScore)")
                    }
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    
                    VStack {
                        VStack {
                            Text(iconArray[self.ramdomQuestion])
                                .font(.system(size: 120))
                            
                            Text(nameArray[self.ramdomQuestion])
                        }
                        .padding()
                        .blur(radius: self.showingAlert ? 0 : 17)
                        .opacity(self.showingAlert ? 1 : 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .shadow(color: .black, radius: 5, x: 0, y: 0)
                        )
                        .padding(.bottom, 20)
                        
                        ForEach(0 ..< nameArray.count) { number in
                            Button(action: {
                                self.showResult(number)
                            }) {
                                HStack {
                                    Text(self.iconArray[number])
                                    Text(self.nameArray[number])
                                }
                                .buttonStyle()
                            }
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle("Rock  Paper  Scissors", displayMode: .inline)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Continue")){
                        self.continueGame()
                        })
                }
            }
        }
    }
    
    func showResult(_ number: Int) {
        
        if ramdomQuestion == number {
            title = "Draw"
            message = "Better luck next time!"
        } else if ramdomQuestion == 2 && number == 0 {
            winner(number)
        } else if ramdomQuestion == 1 && number == 2 {
            winner(number)
        } else if ramdomQuestion == 0 && number == 1 {
            winner(number)
        } else {
            title = "Lose"
            message = "\(nameArray[ramdomQuestion]) beats \(nameArray[number])"
            appScore += 1
        }
        
        showingAlert = true
        
        if count == 11 {
            title = "Final Score (best of 11)"
            if appScore > score {
                message = "You lost \(score) to \(appScore)"
            } else {
                message = "You're a winner"
            }
            showingAlert = true
        }
        
    }
    
    func continueGame() {
        ramdomQuestion = Int.random(in: 0...2)
        count += 1
    }
    
    func winner(_ number: Int) {
        title = "Win"
        message = "\(nameArray[number]) beats \(nameArray[ramdomQuestion])"
        score += 1
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
