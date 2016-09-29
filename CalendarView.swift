//
//  CanlendarView.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/26.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CalendarView:BaseCell{
    
    var weekviewH:CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var CurrentDate:Date?
    {
        didSet
        {
            var weekViews = [UIView]()
            let lastDayOfMonth = DateHelper.getLastDayOfMonth(date: CurrentDate!)
            
           // let s1 = createSperatorLine()

            let firstDayOfMonth:Int = DateHelper.getDayOfMonth(date: CurrentDate!)
            var d = DateHelper.AddDay(currDate: DateHelper.getFirstDayOfMonth(date:CurrentDate!),day:(1-firstDayOfMonth))
            
            var i = 0
            
            var ConstraintString:String = "V:|[v0(20)][v1(20)]"
            while d <= lastDayOfMonth
            {
                weekViews.append(createWeekLayout(weekProperties: WeekProperties(DayViewWidth: self.frame.width, firstDayOfWeek: d)))
                d = DateHelper.AddDay(currDate:d,day:7)
                
                ConstraintString += "[v\(i+2)(height)]"
                i += 1
            }

            let calHeight = ((self.frame.height - 45) / CGFloat(i)) + 1
            ConstraintString = "\(ConstraintString.replacingOccurrences(of: "height", with: String(describing: calHeight)))|"
            
            labelMonth.text = DateHelper.getStringWithDayFormat(fromDate: CurrentDate!, formate: "yyyy/MM")
            addSubview(labelMonth)
            addSubview(weekTitleView)
            //addSubview(s1)
            
            addConstraintsWithFormat("H:|[v0]|", views: labelMonth)
            addConstraintsWithFormat("H:|[v0]|", views: weekTitleView)
            //addConstraintsWithFormat("H:|[v0]|", views: s1)

            for i in 0..<weekViews.count
            {
                addSubview(weekViews[i])
                addConstraintsWithFormat("H:|[v0]|", views: weekViews[i])
            }
            
            //weekViews.insert(s1, at: 0)
            weekViews.insert(weekTitleView, at: 0)
            weekViews.insert(labelMonth, at: 0)

            
            addConstraintsWithFormat(ConstraintString, views: weekViews)
            
            
            
        }
    }
    
    lazy var speratorLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return line
    }()
    
    lazy var weekTitleView: WeekTitleView = {
        let wTitleView = WeekTitleView()
        
        wTitleView.viewWidh = self.frame.width
        return wTitleView
    }()
    
    lazy var labelMonth :UILabel = {
        let lblMonth = UILabel()
        lblMonth.text = "2016/09"
        lblMonth.backgroundColor = UIColor.white
        lblMonth.font = UIFont.boldSystemFont(ofSize: 10)
        lblMonth.textAlignment = .center
        return lblMonth
        
    }()
    
    func createWeekLayout(weekProperties:WeekProperties) ->UIView
    {
        let weekViewLayout = UIView()
        let weekView = WeekView()
        let sperator = createSperatorLine()
        weekViewLayout.translatesAutoresizingMaskIntoConstraints = false
        
        weekViewLayout.addSubview(weekView)
        weekViewLayout.addSubview(sperator)
        
        weekViewLayout.backgroundColor = UIColor.white
        
        weekViewLayout.addConstraintsWithFormat("H:|[v0]|", views: weekView)
        weekViewLayout.addConstraintsWithFormat("H:|[v0]|", views: sperator)
        
        weekViewLayout.addConstraintsWithFormat("V:|[v0][v1(1)]", views: weekView,sperator)
        
        weekView.weekProperties = weekProperties
        
        return weekViewLayout
    }
    
    func createSperatorLine() -> UIView
    {
        let speratorLine = UIView()
        speratorLine.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return speratorLine
    }
}
