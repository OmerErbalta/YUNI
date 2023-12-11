//
//  TabbarView.swift
//  HaBu
//
//  Created by OmerErbalta on 15.11.2023.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var navigation : NavigationStateManager
    var body: some View {
        VStack {
            GeometryReader{proxy in
               let bottomEdge = proxy.safeAreaInsets.bottom
                let topEdge = proxy.safeAreaInsets.leading
                
              
                    TabView(selection:$navigation.selection){
                        FeedView()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .background(Color.primary.opacity(0.1))
                            .tag("Feed")
                            .toolbar(.hidden, for: .tabBar)
                        SerachView()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .background(Color.primary.opacity(0.1))
                            .tag("Search")
                            .toolbar(.hidden, for: .tabBar)
                        NotificationView()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .background(Color.primary.opacity(0.1))
                            .tag("Notification")
                            .toolbar(.hidden, for: .tabBar)
                        ProfileView(user: User.MockData[0])
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .background(Color.primary.opacity(0.1))
                            .tag("Profile")
                            .toolbar(.hidden, for: .tabBar)
                    }
                    .task {
                        navigation.bottomEdge = bottomEdge
                        navigation.topEdge = topEdge
                    }
                    .overlay(
                        VStack{
                            CustomTabbarView(currentTab: $navigation.selection, bottomEdge: bottomEdge)
                        }
                         .offset(y:navigation.hideTabBar ? (15 + 35 + bottomEdge):0)
                        ,alignment: .bottom
                )
                .navigationBarBackButtonHidden(true)
                
                
              
                
            }
        }
        .environmentObject(navigation)
    }
}

#Preview {
    ContentView()
}
private struct CustomTabbarView:View {
    @Binding var currentTab:String
    var bottomEdge:CGFloat
    var body: some View {
        HStack(spacing:0){
            ForEach(Const.tabBarItems,id: \.self){image in
                CustomTabButton(badge: image == "Notification" ? 5:0, image: image, currentTab: $currentTab)
            }
            .background(.white)
            
        }
    }
}

private struct CustomTabButton:View {
    var badge:Int = 0
    var image : String
    @Environment(\.colorScheme) var sheme
    @Binding var currentTab : String
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = image
                
            }
        }, label: {
                Image(image)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top,10)
                .frame(width: 35,height: 35)
                .foregroundStyle(currentTab == image ? Const.primaryColor:Color.gray)
                .overlay(
                    Text("\(badge<100 ? badge: 99)+")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(sheme == .dark ? .black : .white)
                        .padding(.vertical,4)
                        .padding(.horizontal,5)
                        .background(.red,in:Capsule())
                        .background(
                            Capsule().stroke(sheme == .dark ? .black : .white,lineWidth: 2)
                        )
                        .offset(x:20,y:0)
                        .opacity(badge == 0 ? 0 : 1)
                    ,alignment: .topTrailing
                )
                .frame(maxWidth: .infinity)
                .background(.white)
        })
    }
}


