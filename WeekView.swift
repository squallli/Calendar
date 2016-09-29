//
//  WeekView.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/26.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit
class WeekProperties
{
    var dayViewWidth :CGFloat = 0.0
    var FirstDayOfWeek :Date!
    
    init(DayViewWidth:CGFloat,firstDayOfWeek:Date)
    {
        dayViewWidth = DayViewWidth
        FirstDayOfWeek = firstDayOfWeek
    }
    
    
}

class WeekView:UIView
{

    override init(frame: CGRect) {
        super.init(frame: frame)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var weekProperties:WeekProperties?{
        didSet{
            var dayView = [DayView]()
            
            for i in 0..<7
            {
                dayView.append(DayView(frame:.zero,currentDate:(weekProperties?.FirstDayOfWeek)!))
                addSubview(dayView[i])
                
                weekProperties?.FirstDayOfWeek = DateHelper.AddDay(currDate: (weekProperties?.FirstDayOfWeek)!, day: 1)
            }
            
            if let dayViewWidth = weekProperties?.dayViewWidth
            {
                  self.addConstraintsWithFormat("H:|[v0(\(dayViewWidth/7))][v1(\(dayViewWidth/7))][v2(\(dayViewWidth/7))][v3(\(dayViewWidth/7))][v4(\(dayViewWidth/7))][v5(\(dayViewWidth/7))][v6(\(dayViewWidth/7))]", views: dayView[0],dayView[1],dayView[2],dayView[3],dayView[4],dayView[5],dayView[6])
                
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[0])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[1])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[2])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[3])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[4])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[5])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayView[6])
            }

        }
    }
    
    }
