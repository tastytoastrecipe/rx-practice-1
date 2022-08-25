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

    let cellId: String = "cell"
    lazy var table: UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tableview
    }()
    
    lazy var vm: TableVm = {
        let tablevm = TableVm()
        return tablevm
    }()
    
    var sectionRelay = BehaviorRelay<[WaterSection]>(value: [])
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        setContents()
    }
    
    func setConstraints() {
        self.view.addSubview(table)
        table.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    
    func setContents() {
        sectionRelay.accept(vm.sections)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<WaterSection> { [unowned self] dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
            
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
        
        dataSource.canEditRowAtIndexPath = { _, _ in true }
        
        sectionRelay
            .bind(to: table.rx.items(dataSource: dataSource))
            .disposed(by: bag)
  
        /*
        Observable.just(vm.sections)
            .bind(to: table.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        */
        
        table.rx.modelDeleted(Water.self)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] water in
                vm.deleteWater(water: water)
                sectionRelay.accept(vm.sections)
            })
            .disposed(by: bag)
  
    }

}
