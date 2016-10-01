import UIKit

class BaseCell: UICollectionViewCell,DayViewDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tapDay : DayView?
    
    func dayView(onTapDay:DayView)
    {
        if let TapDay = tapDay
        {
            if TapDay.CurrentDate != onTapDay.CurrentDate
            {
                TapDay.backgroundColor = UIColor.white
            }
            
            
        }
        tapDay = onTapDay
        
        onTapDay.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
    }
}

class CalendarView:BaseCell{
    
    var weekviewH:CGFloat = 0.0
    var delegate : CalendarDelegate?
    
    
    
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

            let firstDayOfMonth:Int = DateHelper.getDayOfMonth(date: CurrentDate!)
            var d = DateHelper.AddDay(currDate: DateHelper.getFirstDayOfMonth(date:CurrentDate!),day:(1-firstDayOfMonth))
            
            var i = 0
            
            var ConstraintString:String = "V:|[v0(20)][v1(20)][v2(1)]"
            while d <= lastDayOfMonth
            {
                i += 1
                d = DateHelper.AddDay(currDate:d,day:7)
            }

            let calHeight = (self.frame.height - CGFloat(41)) / CGFloat(i)
            
            d = DateHelper.AddDay(currDate: DateHelper.getFirstDayOfMonth(date:CurrentDate!),day:(1-firstDayOfMonth))
            for j in 0..<i{
                var weekView:UIView?
                
                if let weekDelegate = delegate
                {
                    weekView = createWeekLayout(weekProperties: WeekProperties(DayViewWidth: self.frame.width, currentDate: CurrentDate!,firstDayOfWeek:d),delegate:weekDelegate)
                }
                else{
                    weekView = createWeekLayout(weekProperties: WeekProperties(DayViewWidth: self.frame.width, currentDate: CurrentDate!,firstDayOfWeek:d),delegate:nil)
                }
                weekViews.append(weekView!)
                d = DateHelper.AddDay(currDate:d,day:7)
                
                ConstraintString += "[v\(j+3)(\(calHeight))]"

            }
            
            ConstraintString = "\(ConstraintString)|"
            
            labelMonth.text = DateHelper.getStringWithDayFormat(fromDate: CurrentDate!, formate: "yyyy/MM")
            let s1 = createSperatorLine()
            
            addSubview(labelMonth)
            addSubview(weekTitleView)
            addSubview(s1)
            
            addConstraintsWithFormat("H:|[v0]|", views: labelMonth)
            addConstraintsWithFormat("H:|[v0]|", views: weekTitleView)
            addConstraintsWithFormat("H:|[v0]|", views: s1)

            for i in 0..<weekViews.count
            {
                addSubview(weekViews[i])
                addConstraintsWithFormat("H:|[v0]|", views: weekViews[i])
            }
            
            weekViews.insert(s1, at: 0)
            weekViews.insert(weekTitleView, at: 0)
            weekViews.insert(labelMonth, at: 0)

            addConstraintsWithFormat(ConstraintString, views: weekViews)

        }
    }
    
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
    
    func createWeekLayout(weekProperties:WeekProperties,delegate:CalendarDelegate?) ->UIView
    {
        let weekViewLayout = UIView()
        let weekView = WeekView()
        let sperator = createSperatorLine()
        
        weekViewLayout.addSubview(weekView)
        weekViewLayout.addSubview(sperator)
        
        
        
        weekViewLayout.addConstraintsWithFormat("H:|[v0]|", views: weekView)
        weekViewLayout.addConstraintsWithFormat("H:|[v0]|", views: sperator)
        
        weekViewLayout.addConstraintsWithFormat("V:|[v0][v1(1)]|", views: weekView,sperator)
        
        
        if let weekDelegate = delegate{
            weekView.delegate = weekDelegate
        }

        weekView.dayViewdelegate = self
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
