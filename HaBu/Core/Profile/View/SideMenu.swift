//
//  SideMenu.swift
//  HaBu
//
//  Created by yusuf on 16.11.2023.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
        VStack {
            Spacer()
            NavigationLink {
                EditProfileView()
            } label: {
                Text("Ayarlar").foregroundColor(.white)
                    .font(.title3)
            }
            .frame(height: 50)
            NavigationLink {
                EditProfileView()
            } label: {
                Text("Engellene kullanıcılar").foregroundColor(.white)
                    .font(.title3)
            }
            .frame(height: 50)
            NavigationLink {
                EditProfileView()
            } label: {
                Text("Puanlarım").foregroundColor(.white)
                    .font(.title2)
            }
            .frame(height: 50)
            NavigationLink {
                EditProfileView()
            } label: {
                Text("Geri Bildirim").foregroundColor(.white)
                    .font(.title2)
            }
            .frame(height: 50)
            NavigationLink {
                EditProfileView()
            } label: {
                Text("Çıkış Yap").foregroundColor(.white)
                    .font(.title2)
            }
            .frame(height: 50)
            
            Spacer()
        }
        .frame(width: 175)
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    SideMenu()
}
