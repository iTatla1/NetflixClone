//
//  HorizontalButton.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct WhiteButton: View {
    let text: String
    let image: String
    
    let action: () -> Void
    
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
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(4)
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton(text: "Play", image: "play.fill") {}
            .previewLayout(.fixed(width: 150, height: 44))
    }
}
