//
//  TableReactor.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/25.
//

import RxSwift

class TableVm {
    
    var waterItems = [
        MultipleItem.water(water: Water(identity: "water-1", name: "삼다수", origin: "제주도", company: "제주 삼다수")),
        MultipleItem.water(water: Water(identity: "water-2", name: "평창수", origin: "강원도 평창군", company: "해태 htb")),
        MultipleItem.water(water: Water(identity: "water-3", name: "evian", origin: "프랑스 에비앙", company: "DANONE")),
        MultipleItem.water(water: Water(identity: "water-4", name: "백산수", origin: "중국 지린성 안투현", company: "농심"))
    ]
    
    var companyItems = [
        MultipleItem.company(company: Company(identity: "company-1", name: "제주 삼다수", location: "제주특별자치도 제주시 조천읍 남조로 1717-35", scence: "scence 1995")),
        MultipleItem.company(company: Company(identity: "company-2", name: "해태 htb", location: "서울 종로구 새문안로 58 (LG 광화문 빌딩)", scence: "scence 1973")),
        MultipleItem.company(company: Company(identity: "company-3", name: "DANONE", location: "17, boulevard Haussmann 75009 프랑스 파리", scence: "scence 1919")),
        MultipleItem.company(company: Company(identity: "company-4", name: "농심", location: "서울특별시 동작구 여의대방로 112", scence: "scence 1965"))
    ]
    
//    var waterSections: [WaterSection] = []
//    var companySections: [CompanySection] = []
    var multipleSections: [MultipleSection] = []
    var bag = DisposeBag()
    
    init() {
        
//        let items1 = [
//            Water(identity: "water-1", name: "삼다수", origin: "제주도", company: "제주 삼다수"),
//            Water(identity: "water-2", name: "평창수", origin: "강원도 평창군", company: "해태 htb"),
//            Water(identity: "water-3", name: "evian", origin: "프랑스 에비앙", company: "DANONE"),
//            Water(identity: "water-4", name: "백산수", origin: "중국 지린성 안투현", company: "농심")
//        ]
//
//        let items2 = [
//            Company(identity: "company-1", name: "제주 삼다수", location: "제주특별자치도 제주시 조천읍 남조로 1717-35", scence: "scence 1995"),
//            Company(identity: "company-2", name: "해태 htb", location: "서울 종로구 새문안로 58 (LG 광화문 빌딩)", scence: "scence 1973"),
//            Company(identity: "company-3", name: "DANONE", location: "17, boulevard Haussmann 75009 프랑스 파리", scence: "scence 1919"),
//            Company(identity: "company-4", name: "농심", location: "서울특별시 동작구 여의대방로 112", scence: "scence 1965")
//        ]
        
        
//        waterSections.append(WaterSection(identity: "section 1 identity", header: "식수 브랜드", items: items1))
//        companySections.append(CompanySection(identity: "section 2 identity", header: "식수 기업 정보", items: items2))
        
        setMultipleSection()
    }
    
    /*
    func deleteWater(water: Water) {
        for (i, _) in waterSections.enumerated() {
            waterSections[i].items.removeAll(where: { $0.identity == water.identity })
        }
    }
     */
    
    func deleteItem(item: MultipleItem) {
        waterItems.removeAll(where: { $0.identity == item.identity })
        companyItems.removeAll(where: { $0.identity == item.identity })
        
        multipleSections.removeAll()
        setMultipleSection()
    }
    
    func setMultipleSection() {
        multipleSections.append(.waterSection(identity: "waterSection", header: "식수 브랜드", items: waterItems))
        multipleSections.append(.companySection(identity: "companySection", header: "식수 기업", items: companyItems))
    }
    
}
