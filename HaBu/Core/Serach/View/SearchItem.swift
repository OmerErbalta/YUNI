//
//  SearchItem.swift
//  HaBu
//
//  Created by yusuf on 2.12.2023.
//

import SwiftUI

import SwiftUI

struct SearchItem: View {
    var user: User
    var ratingSorted: Bool
    
    var body: some View {
        NavigationLink(destination: Text("ProfileView")) {
            HStack() {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(user.name) \(user.surName)")
                            .foregroundStyle(Color.white)
                            .font(.title3).fontWeight(.semibold)
                    }
                    HStack {
                        Text(user.department).opacity(0.6).font(.caption2).fontWeight(.semibold).foregroundStyle(Color.white).foregroundColor(Color(UIColor(hex: "#F3F3F3"))).opacity(0.7)
                    }
                    HStack{
                        Image(systemName: "star.fill").foregroundStyle(Color(UIColor(hex: "#C0C0C0"))
                        )
                        Text("\(user.rating, specifier: "%.0f")").foregroundStyle(Color(UIColor(hex: "#FFFFFF")))
                    }.frame(height: Const.height * 0.03)
                }.frame(width: Const.width * 0.35 ,height: Const.height * 0.12 ,alignment: .topLeading)
                
                
                    Image("profil3").resizable()
                        .frame(width: Const.width * 0.5, height: Const.height * 0.15).mask(
                            Path { path in
                                path.move(to: CGPoint(x: 0, y: Const.height * 0.15)) // Sol alt köşe
                                path.addLine(to: CGPoint(x: Const.width * 0.5, y: Const.height * -0.25)) // Üst orta kısma kadar olan nokta
                                path.addLine(to: CGPoint(x: Const.width * 0.5, y: Const.height * 0.15)) // Sağ alt köşe
                                path.closeSubpath()
                            }
                                .fill(style: FillStyle(eoFill: true))
                    )
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.02, green: 0.14, blue: 0.24), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.02, green: 0.14, blue: 0.24).opacity(0.77), location: 0.44),
                        Gradient.Stop(color: Color(red: 0.02, green: 0.14, blue: 0.24).opacity(0.43), location: 0.89),
                        Gradient.Stop(color: Color(red: 0.02, green: 0.14, blue: 0.25).opacity(0.73), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )).cornerRadius(10)
                .cornerRadius(7)
                .overlay( //kenarlıklar
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 1.3)
                        .stroke(.black, lineWidth: 2)
                )
                .background()
                .frame(width: Const.width * 0.9, height: Const.height * 0.13, alignment: .leading)
        }
    }
}

#Preview {
    SearchItem(user: User.MockData[0], ratingSorted: true)
}
