//
//  CompanyCellTableViewCell.swift
//  rx-practice-1
//
//  Created by orca on 2022/08/27.
//

import UIKit
import SnapKit

class CompanyCell: UITableViewCell {

    var name: UILabel!
    var location: UILabel!
    var scence: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name = UILabel()
        contentView.addSubview(name)
        
        location = UILabel()
        contentView.addSubview(location)
        
        scence = UILabel()
        contentView.addSubview(scence)
        
        name.backgroundColor = .lightGray
        scence.backgroundColor = .lightGray
        location.backgroundColor = .systemIndigo
        location.numberOfLines = 0
        
        name.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.equalTo(30)
            make.width.greaterThanOrEqualTo(50).priority(ConstraintPriority.high)
        }
        name.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        location.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(name.snp.bottom)
        }
        
        scence.snp.makeConstraints { make in
            make.leading.equalTo(name.snp.trailing).offset(20).priority(ConstraintPriority.medium)
            make.top.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        scence.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        print("CompnayCell::init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("CompanyCell::setSelected\n - cell: \(name.text ?? "")")
    }
    
    func configure(name: String, location: String, scence: String) {
        self.name.text = name
        self.location.text = location
        self.scence.text = scence
    }

}
