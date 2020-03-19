//
//  ButtonModifier.swift
//  RockPaperScissors
//
//  Created by Nigel Gee on 19/03/2020.
//  Copyright © 2020 Nigel Gee. All rights reserved.
//

import SwiftUI

struct ButtonLayout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: 200, maxHeight: 50)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonLayout())
    }
}
