//
//  CostomButton.swift
//  HaBu
//
//  Created by mert alp on 15.11.2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    var destinaiton : AnyView
    var width : Double?

       var body: some View {
           Button(
               action: action) {
                   NavigationLink(destination: destinaiton) {
                       Text(title)
                           .padding()
                           .frame(width: width ?? Const.screenWidht/2  ,height: 30 )
                           .background(backgroundColor)
                           .foregroundColor(.white)
                           .cornerRadius(4)
                   }
                   
               }
    }
}

#Preview {
    CustomButton(title: "login", backgroundColor: Const.primaryColor, action: {}, destinaiton: AnyView(LoginView()))
}
