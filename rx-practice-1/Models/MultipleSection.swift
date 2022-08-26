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
}

enum MultipleSection {
    case waterSection(identity: String, header: String, items: [MultipleItem])
    case companySection(identity: String, header: String, items: [MultipleItem])
}

extension MultipleSection: AnimatableSectionModelType {
    typealias Item = MultipleItem
    typealias Identity = String
    
    var items: [MultipleItem] {
        switch self {
        case .waterSection(_, _, let items):
            return items
        case .companySection(_, _, let items):
            return items
        }
    }
    
    var identity: String {
        switch self {
        case .waterSection(_, _, _):
            return "section1"
        case .companySection(_, _, _):
            return "section2"
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
    
    init(original: MultipleSection, items: [MultipleItem]) {
        switch original {
        case let .waterSection(identity, header, items):
            self = .waterSection(identity: identity, header: header, items: items)
        case let .companySection(identity, header, items):
            self = .companySection(identity: identity, header: header, items: items)
        }
    }
}


