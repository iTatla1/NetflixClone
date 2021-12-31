//
//  HorizontalButton.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct PlayButton: View {
    let text: String
    let image: String
    let action: () -> Void

    var backgroundColor: Color = .white
    
    var body: some View {
        Button (action: action) {
                HStack {
                    Spacer()
                    Image(systemName: image)
                        .font(.headline)
                    
                    Text(text)
                        .font(.system(size: 16))
                        .bold()
                    Spacer()
                }
                .padding(.vertical, 6)
                .foregroundColor(backgroundColor == .white ? .black : .white)
                .background(backgroundColor)
                .cornerRadius(4)
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(text: "Play", image: "play.fill") {}
            .previewLayout(.fixed(width: 150, height: 44))
    }
}
