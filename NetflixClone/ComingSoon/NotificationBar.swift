//
//  NotificationBar.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/8/22.
//

import SwiftUI

struct NotificationBar: View {
    @Binding var showNotificationList: Bool
    var body: some View {
        Button {
            showNotificationList = true
            
        } label: {
            HStack {
                Image(systemName: "bell")
                Text("Notification")
                Spacer()
                
                Image(systemName: "chevron.forward")
            }
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
