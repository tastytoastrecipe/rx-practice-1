//
//  MultipleSection.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/27.
//

import RxDataSources

enum MultipleItem: Equatable, IdentifiableType {
    case water(water: Water)
    case company(company: Company)
    
    var identity: String {
        switch self {
        case .water(let water):
            return water.identity
        case .company(let company):
            return company.identity
        }
    }
    
    static func ==(lhs: MultipleItem, rhs: MultipleItem) -> Bool {
            return lhs.identity == rhs.identity
        }
}

enum MultipleSection {
    case waterSection(identity: String, header: String, items: [MultipleItem])
    case companySection(identity: String, header: String, items: [MultipleItem])
}

extension MultipleSection: AnimatableSectionModelType {
    typealias Item = MultipleItem
    typealias Identity = String
    
    var items: [Item] {
        switch self {
        case .waterSection(_, _, let items):
            return items
        case .companySection(_, _, let items):
            return items
        }
    }
    
    var identity: String {
        switch self {
        case .waterSection(let identity, _, _):
            return identity
        case .companySection(let identity, _, _):
            return identity
        }
    }
    
    var header: String {
        switch self {
        case .waterSection(_, let header, _):
            return header
        case .companySection(_, let header, _):
            return header
        }
    }
    
    init(original: MultipleSection, items: [Item]) {
        switch original {
        case .waterSection(_, _, _):
            self = .waterSection(identity: original.identity, header: original.header, items: items)
        case .companySection(_, _, _):
            self = .companySection(identity: original.identity, header: original.header, items: items)
        }
    }
    
    mutating func deleteItem(identity: String) {
        switch self {
        case let .waterSection(_, _, items):
            var newItems = items
            newItems.removeAll(where: { $0.identity == identity })
            self = MultipleSection.waterSection(identity: self.identity, header: self.header, items: newItems)
        case let .companySection(_, _, items):
            var newItems = items
            newItems.removeAll(where: { $0.identity == identity })
            self = MultipleSection.companySection(identity: self.identity, header: self.header, items: newItems)
        }
    }
}


