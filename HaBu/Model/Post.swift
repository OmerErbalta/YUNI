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
    var imageUrl : [String]?
    let timeStamp : Timestamp
    var likeList : [String]
    let isAnonim : Bool
    let tags : [String]
    let isAnonimComment : Bool
    
}
extension Post {
    static var MockData: [Post] = [
        .init(id: "0", userId: "0", caption: "Mert, sadece bir geliştirici değil, aynı zamanda olağanüstü bir karaktere sahip. Kod yazma yeteneği sadece başarılarına değil, aynı zamanda etrafındaki insanlara ilham kaynağı olmasına da olanak tanıyor. Mert, herkesin anlayabileceği, temiz ve etkili kodlar yazma konusundaki becerisiyle ön plana çıkıyor. Başarıları, sadece kendi başarısı için değil, etrafındaki insanlara da ışık tutuyor. Mert'in karakteri, sadece kod yazma becerileriyle değil, aynı zamanda insanlar arasında kurduğu olumlu ilişkilerle de parlıyor.", imageUrl: ["https://developer.apple.com/swift/images/swift-og.png"], timeStamp:Timestamp(date:.now), likeList: ["2"],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "1", userId: "1", caption: "Mert, içten ve nezaketle dolu bir kişiliktir. Onun etrafında, insanların hemen fark edeceği samimi bir sıcaklık vardır. Başkalarına karşı duyarlılığı ve yardımseverliğiyle tanınır. Zorlu durumlarda bile sakinliğini koruyarak çözüm odaklı yaklaşımıyla öne çıkar. Mert’in içindeki güç, sadece kendi başarısı için değil, etrafındaki insanların da başarıları için çaba göstermesine olanak tanır. Herkesin güçlü ve zayıf yanlarını anlayarak onlara destek olur ve hep birlikte daha iyi bir gelecek için çalışır. Mert, sadece biri için değil, herkes için ilham kaynağıdır.",timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "2", userId: "2", caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec tellus ullamcorper, vulputate neque a, accumsan purus. Nulla facilisi. Vivamus eu sapien et ex vestibulum ultricies sit amet eu turpis. In hac habitasse platea dictumst. Vestibulum condimentum velit eu suscipit elementum.", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "3", userId: "3", caption: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur ut justo a tortor iaculis consectetur id vel arcu. Integer nec augue vel orci feugiat semper. Nulla facilisi. Vestibulum eget lacus vestibulum, tristique tortor et, vehicula nunc.", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "4", userId: "4", caption: "Mert, yazdığı kodlarla gerçekten harika işlere imza atıyor. Başarılı ve etkili çözümleriyle projelere değer katıyor. Sadece bir geliştirici olarak değil, aynı zamanda ekip arkadaşı olarak da mükemmel bir performans sergiliyor.", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "5", userId: "5", caption: "Mert ve Fatih Terim'in samimi arkadaşlığı göz kamaştırıcı. Birlikte geçirdikleri zamanlarda gülüşmeleri, takım ruhu ve kararlılıkla dolu. Bu ikili, hem profesyonel hem de kişisel hayatta birbirlerine destek oluyor. Gerçek bir dostluk örneği!",  timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "6", userId: "6", caption: "Fatih Terim ve Mert, her ortamda birbirlerine destek oluyorlar. Başarılarını paylaşırken birbirlerine olan güvenleri ve samimiyetleri dikkat çekici. Mert'in geliştirici yetenekleriyle Terim'in liderlik ve motivasyonu harika bir uyum içinde. Dostlukları herkes için ilham kaynağı!", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "7", userId: "7", caption: "Fatih Terim ve Mert'in arkadaşlığı, sadece işbirliği değil, aynı zamanda samimiyetle dolu bir dostluğun örneği. Her ikisi de birbirlerine olan güvenlerini ve saygılarını her fırsatta gösteriyorlar. Bu ikili, sadece iş dünyasında değil, aynı zamanda hayatın zorluklarıyla başa çıkarken birbirlerine destek oluyor.", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
        .init(id: "8", userId: "8", caption: "Fatih Terim ve Mert'in arkadaşlığı, samimiyetleri ve birbirlerine olan saygılarıyla dolu. İkili, hem iş hem de kişisel hayatta birbirlerine destek oluyor. Bu dostluk, sadece başarıları değil, aynı zamanda zor zamanlarda birbirlerine güç veren bir bağ.", timeStamp:Timestamp(date:.now), likeList: [],isAnonim: false,tags: [],isAnonimComment: false),
    ]
}
