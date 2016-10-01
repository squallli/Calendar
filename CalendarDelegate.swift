//
//  CalendarDelegate.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/29.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

protocol CalendarDelegate {
    
    func calendar(dayView:DayView,date:Date) -> DayView
}

protocol DayViewDelegate{
    func dayView(onTapDay:DayView)
}
