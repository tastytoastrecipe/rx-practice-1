//
//  Water.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/25.
//

//import RxDataSources
//
//struct Water: Equatable, IdentifiableType {
//    var identity: String
//    var name: String
//    var origin: String
//    var company: String
//}
//
//struct WaterSection {
//    var identity: String
//    var header: String
//    var items: [Item]
//}
//
//extension WaterSection: AnimatableSectionModelType {
//    typealias Item = Water
//
//    init(original: WaterSection, items: [Water]) {
//        self = original
//        self.items = items
//    }
//}

struct Water: Equatable {
    var identity: String
    var name: String
    var origin: String
    var company: String
}


