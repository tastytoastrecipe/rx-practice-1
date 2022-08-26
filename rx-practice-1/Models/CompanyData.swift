//
//  CompanyData.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/27.
//

//import RxDataSources
//
//struct Company: Equatable, IdentifiableType  {
//    var identity: String
//    var name: String
//    var location: String
//    var scence: String
//}
//
//struct CompanySection {
//    var identity: String
//    var header: String
//    var items: [Company]
//}
//
//extension CompanySection: AnimatableSectionModelType {
//    typealias Item = Company
//
//    init(original: CompanySection, items: [Company]) {
//        self = original
//        self.items = items
//    }
//}


struct Company: Equatable {
    var identity: String
    var name: String
    var location: String
    var scence: String
}
