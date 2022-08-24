//
//  MainVc.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/23.
//

import UIKit
import SnapKit
import ReactorKit
import RxSwift
import RxCocoa

class MainVc: UIViewController, View {
    var disposeBag = DisposeBag()
    
    lazy var tableVc: TableVc = { return TableVc() }()
    var tabbar: UITabBar?
    
    init(reactor: MainReactor) {
        super.init(nibName: nil, bundle: nil)
        
        let icon1 = UITabBarItem(title: "TableVc", image: UIImage.init(systemName: "tray.2"), selectedImage: UIImage.init(systemName: "tray.2.fill"))
        icon1.tag = Scenes.table.rawValue
//        tableVc.tabBarItem = icon1
        tabbar = UITabBar()
        tabbar?.setItems([icon1], animated: true)
        
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        if let tabbar = tabbar {
            self.view.addSubview(tabbar)
            tabbar.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(90)
            }
            
            if let firstItem = tabbar.items?.first {
                tabbar.selectedItem = firstItem
                Observable.just(MainReactor.Action.tapItem(firstItem))
                    .bind(to: self.reactor!.action)
                    .disposed(by: disposeBag)
            }
            
        }
    }
    
    func bind(reactor: MainReactor) {
        // Action
        tabbar?.rx.didSelectItem
            .map { MainReactor.Action.tapItem($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State
        reactor.state
            .map { $0.currentScene }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] scene in
                self?.gotoScene(scene: scene)
            })
            .disposed(by: disposeBag)
    }
    
    func gotoScene(scene: Scenes) {
        switch scene {
        case .main: break
        case .table:
            guard let tabbar = tabbar else { return }
            if self.children.contains(tableVc) { return }
            
            self.addChild(tableVc)
            self.view.addSubview(tableVc.view)
            tableVc.view.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.bottom.equalTo(tabbar.snp.top)
            }
        case .collection: break
        case .stack: break
        case .scroll: break
        }
    }
    
}
