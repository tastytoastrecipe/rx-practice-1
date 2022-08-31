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
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        
        let background = UIView()
        contentView.addSubview(background)
        background.snp.makeConstraints { make in
            make.leading.trailing.equalTo(20)
            make.top.bottom.equalTo(10)
        }
        
        name = UILabel()
        name.textColor = .red
        name.font = UIFont.systemFont(ofSize: 17)
        background.addSubview(name)
        
        location = UILabel()
        location.numberOfLines = 0
        location.textColor = .gray
        location.font = UIFont.systemFont(ofSize: 12)
        background.addSubview(location)
        
        scence = UILabel()
        scence.textColor = .lightGray
        background.addSubview(scence)
        
        name.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.equalTo(30)
            make.width.greaterThanOrEqualTo(50).priority(ConstraintPriority.high)
        }
        name.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        location.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(18)
            make.height.equalTo(14)
        }
        
        scence.snp.makeConstraints { make in
            make.leading.equalTo(name.snp.trailing).offset(4).priority(ConstraintPriority.medium)
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
        self.scence.text = "(\(scence))"
    }

}
