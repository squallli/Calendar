//
//  DayView.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/26.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class DayView:UIView{
       var CurrentDate:Date!
    
    init(frame: CGRect,currentDate:Date) {
        super.init(frame: frame)
    
        backgroundColor = UIColor.white
        CurrentDate = currentDate
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dayView:UILabel =
        {
            let labelTitle = UILabel()
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            labelTitle.text = DateHelper.getStringWithDayFormat(fromDate: self.CurrentDate, formate: "dd")
            labelTitle.textAlignment = .center
            labelTitle.font = UIFont(name: "HelveticaNeue", size: 12)
            return labelTitle
    }()
    
    func setupViews()
    {
        self.addSubview(dayView)
        
        self.addConstraintsWithFormat("V:|[v0(12)]", views: dayView)
        self.addConstraintsWithFormat("H:|[v0]|", views: dayView)
    }
}
