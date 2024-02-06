//
//  FeedView.swift
//  HaBu
//
//  Created by OmerErbalta on 14.11.2023.
//

import SwiftUI
import RxSwift
import RxCocoa

struct FeedView: View {
    @StateObject var  feedVM = FeedViewModel()
    @State var showCategoryFilter = false
    var bottomEdge:CGFloat
    @Binding var hideTab:Bool
    @State var offset:CGFloat = 0
    @State var lastOffset:CGFloat = 0
    @State var messageBox = 20
    @State var addPostButtonPosition = CGPoint(x: 10, y: 20)
    @State var navigate = false
    @State var navigationPage : AnyView? = nil
    let disposeBag = DisposeBag()
    @State var posts = [Post]()
    
    private func setupBinding(){
        print("func")
        feedVM
            .postsData
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { posts in
                self.posts = posts
            }.disposed(by: disposeBag)
    }
    var body: some View {
            VStack {
                ScrollView(.vertical,showsIndicators: false){
                    if posts == []{
                        
                        VStack (alignment:.center){
                            HStack(spacing:20){
                                ProgressView()
                                Text(" Yükleniyor")
                            }
                            .padding(.top,Const.height * 0.12)
                        }
                        .frame(width: Const.width)
                    }
                    else{
                        VStack (alignment:.leading){
                            ForEach(posts , id: \.id){post in
                                 FeedViewCell(post: post,user: User.MockData[0])
                                 Divider()
                             }
                         }
                        .padding(.top,Const.height * 0.12)
                            .overlay(
                                GeometryReader{proxy -> Color in
                                    let minY = proxy.frame(in: .named("SCROLL")).minY
                                    let durationOffset: CGFloat = 35
                                    DispatchQueue.main.async {
                                        print(minY)
                                        if minY < offset{
                                    
                                            if offset < 0 && -minY > (lastOffset + durationOffset){
                                                withAnimation(.easeOut ){
                                                    print(offset)
                                                    hideTab = true
                                                }
                                                lastOffset = -offset
                                            }
                                            
                                        }
                                        if minY > offset && -minY < (lastOffset - durationOffset){
                                            withAnimation(.easeOut){
                                                hideTab = false
                                            }
                                            lastOffset = -offset
                                            
                                        }
                                        self.offset = minY
                                    }
                                    return Color.clear
                                    
                                }
                                
                            )
                            .padding()
                            .padding(.bottom,15 + bottomEdge + 35)
                    }
                  
                    
                }
                .onAppear{
                    print("deneme")
                    setupBinding()
                }
                
                .coordinateSpace(name:"SCROLL")
                //TollBar
                .overlay(
                    FeedViewTollBar(showCategoryFilter: $showCategoryFilter, messageBox: $messageBox)
                        .background(.white)
                        .offset(y:hideTab ? (-15 - 70 ) :0)
                    ,alignment: .top
                )
                .ignoresSafeArea(.all,edges: .all)
                //Slidable Button
                .overlay(
                    Buttons.SlidableButton(action: {
                        navigate = true
                        navigationPage = AnyView(AddPostView())
                    }, position: CGPoint(x: 20, y: 40), dragDirection: .right, text: "Post Ekle", color: Const.primaryColor, textColor: .white)
                    .offset(x:hideTab ? -Const.width * 0.5:0)
                    
                )
                .sheet(isPresented: $showCategoryFilter) {
                    CategoryFilterBottomSheet()
                        .presentationDetents([.height(Const.height * 0.6)])
                }
            }
          
        .navigationDestination(isPresented: $navigate) {
            navigationPage
        }
     
        
    }
}


#Preview {
    TabbarView()
}


struct FeedViewTollBar:View {
    @Binding var showCategoryFilter:Bool
    @Binding var messageBox : Int
    
    @Environment(\.colorScheme) var sheme
    var body: some View {
        VStack{
            HStack{
                Text("Yuni").foregroundStyle(Const.primaryColor).font(.custom("Kodchasan-Bold", size: 40))
                    .padding(10)
                Spacer()
                
                Button(action: {
                    showCategoryFilter = true
                    
                }, label: {
                    Image.iconManager(.filter, size: 20, weight: .bold, color: .black).padding(20)
                })
                //message icon
                //this will active at next version
              /*
               
               Button(action: {
                   // -> MessageBox View
                   
               }, label: {
                   Image.iconManager(.tray, size: 25, weight: .bold, color: .black)
                       .padding(.top,10)
                       .overlay(
                           Text("\(messageBox < 100 ? messageBox: 99)+")
                               .font(.caption2)
                               .fontWeight(.bold)
                               .foregroundStyle(sheme == .dark ? .black : .white)
                               .padding(.vertical,2)
                               .padding(.horizontal,3)
                               .background(.red, in: Capsule())
                               .background(
                                   Capsule().stroke(sheme == .dark ? .black:.white,lineWidth:2)
                               )
                           
                           ,alignment: .topTrailing
                       )
                       .padding(20)
                   
               }
                      
               )
               */
                
                
                
            }
            
        }
        
        .padding(.horizontal,15)
        .padding(.top, 15)
        .overlay(
            Rectangle()
                .stroke().opacity(0.3)
                .background(Color.clear)
        )
    }
}
