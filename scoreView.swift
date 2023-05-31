//
//  scoreView.swift
//  kahoot quiz
//
//  Created by T Krobot on 31/5/23.
//

import SwiftUI

struct scoreView: View {
    var score : Int
    var total : Int 
    var body: some View {
        VStack {
            Text("your socre is \(score)/\(total)")
            
            if score < total/2 {
                Text("wow you're bad at this..")
            }
            
            if score == total {
                Text("good job!")
            }
        }
    }
}

struct scoreView_Previews: PreviewProvider {
    static var previews: some View {
        scoreView(score: 3, total: 10)
    }
}
