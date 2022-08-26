//
//  TableVc.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

class TableVc: UIViewController {

    let waterCellId: String = "waterCell"
    lazy var table: UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: waterCellId)
        tableview.register(CompanyCell.self, forCellReuseIdentifier: String(describing: CompanyCell.self))
        return tableview
    }()
    
    lazy var vm: TableVm = {
        let tablevm = TableVm()
        return tablevm
    }()
    
//    var waterSectionRelay = BehaviorRelay<[WaterSection]>(value: [])
//    var companySectionRelay = BehaviorRelay<[CompanySection]>(value: [])
    var multipleSectionRelay = BehaviorRelay<[MultipleSection]>(value: [])
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
//        setWaterTable()
//        setCompanyTable()
        setTable()
    }
    
    func setConstraints() {
        self.view.addSubview(table)
        table.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    
    /*
    func setWaterTable() {
        waterSectionRelay.accept(vm.waterSections)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<WaterSection> { [unowned self] dataSource, tableView, indexPath, item in
                
            let cell = tableView.dequeueReusableCell(withIdentifier: self.waterCellId, for: indexPath)
            
            if #available(iOS 14, *) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                config.secondaryText = item.origin
                cell.contentConfiguration = config
            } else {
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = item.origin
            }
            
            return cell
        }
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }
        
        dataSource.canEditRowAtIndexPath = { _, _ in true }
        
        waterSectionRelay
            .bind(to: table.rx.items(dataSource: dataSource))
            .disposed(by: bag)
  
        /*
        Observable.just(vm.sections)
            .bind(to: table.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        */
        
        table.rx.modelDeleted(Water.self)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] water in
                self?.vm.deleteWater(water: water)
                if let sections = self?.vm.waterSections { self?.waterSectionRelay.accept(sections) }
            })
            .disposed(by: bag)
        
        // 터치한 후 선택 상태 해제
        table.rx.itemSelected
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe { [weak self] indexPath in
                self?.table.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: bag)
  
        /* itemSelected, modelSelected를 zip으로 동시에 받음
        Observable.zip(table.rx.modelSelected(Water.self), table.rx.itemSelected)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .bind { [unowned self] (water, index) in
                vm.deleteWater(water: water)
                sectionRelay.accept(vm.sections)
                self.table.deselectRow(at: index, animated: true)
            }
            .disposed(by: bag)
         */
        
    }
     */
    
    func setTable() {
        multipleSectionRelay.accept(vm.multipleSections)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<MultipleSection> { dataSource, tableView, indexPath, _ in
            switch dataSource[indexPath] {
            case let .water(water):
                
                let cell = tableView.dequeueReusableCell(withIdentifier: self.waterCellId, for: indexPath)
                
                if #available(iOS 14, *) {
                    var config = cell.defaultContentConfiguration()
                    config.text = water.name
                    config.secondaryText = water.origin
                    cell.contentConfiguration = config
                } else {
                    cell.textLabel?.text = water.name
                    cell.detailTextLabel?.text = water.origin
                }
                
                return cell
                
            case let .company(company):
                
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompanyCell.self), for: indexPath) as! CompanyCell
                cell.configure(name: company.name, location: company.location, scence: company.scence)
                
                return cell
            }
        }
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }
        
        dataSource.canEditRowAtIndexPath = { _, _ in true }
        
        
        multipleSectionRelay
            .bind(to: table.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    

}
