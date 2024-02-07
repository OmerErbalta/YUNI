//
//  Post.swift
//  HaBu
//
//  Created by yusuf on 14.11.2023.
//

import Foundation
import Firebase



struct Post : Identifiable,Codable,Hashable{
    let id : String
    let userId : String
    let caption : String
    var imageUrl : [String]
    let timeStamp : String
    let likeList : [String]
    let isAnonim : Bool
    let isAnonimComment : Bool
    let tags :[String]
}
extension Post {
    static var MockData: [Post] = [
        .init(id: "0", userId: "0", caption: "Mert, sadece bir geliştirici değil, aynı zamanda olağanüstü bir karaktere sahip. Kod yazma yeteneği sadece başarılarına değil, aynı zamanda etrafındaki insanlara ilham kaynağı olmasına da olanak tanıyor.", imageUrl: ["https://developer.apple.com/swift/images/swift-og.png"], timeStamp: "01.01.2022", likeList: ["2"], isAnonim: false, isAnonimComment: false, tags: []),
        .init(id: "1", userId: "1", caption: "Mert, içten ve nezaketle dolu bir kişiliktir. Onun etrafında, insanların hemen fark edeceği samimi bir sıcaklık vardır. Başkalarına karşı duyarlılığı ve yardımseverliğiyle tanınır.", imageUrl: [], timeStamp: "02.02.2022", likeList: [], isAnonim: false, isAnonimComment: false, tags: []),
        // Diğer postları buraya kısaltarak ekle

    ]
}
