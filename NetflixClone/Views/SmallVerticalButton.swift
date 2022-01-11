//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct SmallVerticalButton: View {
    let text: String
    let isOnImage: String
    let isOffImage: String
    var isOn: Bool
    var color: Color? = .white
    
    let action: () -> Void

    var imageName: String {
        isOn ? isOnImage : isOffImage
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: imageName)
                Text(text)
                    .font(.system(size: 14))
                    .bold()
                    .padding(.vertical, 6)
            }
            .foregroundColor(color)
        }

    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                print("Pressed")
            }
        }
            
    }
}
