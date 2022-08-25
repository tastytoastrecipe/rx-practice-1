//
//  TableReactor.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/25.
//

import RxSwift

class TableVm {
    
    var sections: [WaterSection] = []
    var bag = DisposeBag()
    
    init() {
        
        let items1 = [
            Water(identity: "water-1", name: "삼다수", origin: "제주도", company: "제주 삼다수"),
            Water(identity: "water-2", name: "평창수", origin: "강원도 평창군", company: "해태 htb"),
            Water(identity: "water-3", name: "evian", origin: "프랑스 에비앙", company: "DANONE"),
            Water(identity: "water-4", name: "백산수", origin: "중국 지린성 안투현", company: "농심")
        ]
        
        sections.append(WaterSection(identity: "section 1 identity", header: "section 1 header", items: items1))
    }
    
    
    func deleteWater(water: Water) {
        print("지우기 전: \(sections)")
        for (i, _) in sections.enumerated() {
            sections[i].items.removeAll(where: { $0.identity == water.identity })
        }
        
        print("지운 후: \(sections)")
    }
    
}
