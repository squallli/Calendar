//
//  WeekTitleView.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/26.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class WeekTitleView:UIView{
    
    var dayViewWidth:CGFloat = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var viewWidh:CGFloat?{
        didSet{
            dayViewWidth = viewWidh! / 7
            
            
            let 周日 = DayTitleView(frame:CGRect.zero,titleText:"週日",TitleColor:UIColor.red)
            let 周一 = DayTitleView(frame:CGRect.zero,titleText:"週一",TitleColor:UIColor.black)
            let 周二 = DayTitleView(frame:CGRect.zero,titleText:"週二",TitleColor:UIColor.black)
            let 周三 = DayTitleView(frame:CGRect.zero,titleText:"週三",TitleColor:UIColor.black)
            let 周四 = DayTitleView(frame:CGRect.zero,titleText:"週四",TitleColor:UIColor.black)
            let 周五 = DayTitleView(frame:CGRect.zero,titleText:"週五",TitleColor:UIColor.black)
            let 周六 = DayTitleView(frame:CGRect.zero,titleText:"週六",TitleColor:UIColor.blue)
            
            
            self.addSubview(周日)
            self.addSubview(周一)
            self.addSubview(周二)
            self.addSubview(周三)
            self.addSubview(周四)
            self.addSubview(周五)
            self.addSubview(周六)
            
            self.addConstraintsWithFormat("V:|[v0]|", views: 周日)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周一)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周二)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周三)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周四)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周五)
            self.addConstraintsWithFormat("V:|[v0]|", views: 周六)
            
            self.addConstraintsWithFormat("H:|[v0(\(dayViewWidth))][v1(\(dayViewWidth))][v2(\(dayViewWidth))][v3(\(dayViewWidth))][v4(\(dayViewWidth))][v5(\(dayViewWidth))][v6(\(dayViewWidth))]|", views: 周日,周一,周二,周三,周四,周五,周六)
        }
    }
}
