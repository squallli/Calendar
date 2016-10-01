import UIKit
class WeekProperties
{
    var dayViewWidth :CGFloat = 0.0
    var CurrentDate :Date!
    var FirstDateOfWeek:Date!
    
    init(DayViewWidth:CGFloat,currentDate:Date,firstDayOfWeek:Date)
    {
        dayViewWidth = DayViewWidth
        CurrentDate = currentDate
        FirstDateOfWeek = firstDayOfWeek
    }
}

class WeekView:UIView
{

    var delegate : CalendarDelegate?
    var dayViewdelegate:DayViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onDayViewClick(_ sender: UITapGestureRecognizer){
        if let dayView = sender.view as? DayView{
            if let delete = dayViewdelegate{
                delete.dayView(onTapDay: dayView)
            }
        }
        
    }
    
    var weekProperties:WeekProperties?{
        didSet{
            
            var dayViews = [DayView]()
            self.setNeedsLayout()
            self.layoutIfNeeded()
        
            let nowMonth = DateHelper.getStringWithDayFormat(fromDate: (weekProperties?.CurrentDate)!, formate: "MM")
            
            for i in 0..<7
            {
                var day = DayView()
                day.CurrentDate = weekProperties?.FirstDateOfWeek
                
                let TapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.onDayViewClick (_:)))
                day.addGestureRecognizer(TapGesture)
                
                if let dayDelegate = delegate {
                    day = dayDelegate.calendar(dayView: day, date: (weekProperties?.FirstDateOfWeek)!)
                }
                
                if DateHelper.getStringWithDayFormat(fromDate: (weekProperties?.FirstDateOfWeek)!, formate: "MM").compare(nowMonth) != .orderedSame
                {
                    day.dayView.textColor = UIColor.lightGray
                }
                
                dayViews.append(day)
                
                addSubview(dayViews[i])
                weekProperties?.FirstDateOfWeek = DateHelper.AddDay(currDate: (weekProperties?.FirstDateOfWeek)!, day: 1)
            }
            
            if let dayViewWidth = weekProperties?.dayViewWidth
            {
                  self.addConstraintsWithFormat("H:|[v0(\(dayViewWidth/7))][v1(\(dayViewWidth/7))][v2(\(dayViewWidth/7))][v3(\(dayViewWidth/7))][v4(\(dayViewWidth/7))][v5(\(dayViewWidth/7))][v6(\(dayViewWidth/7))]|", views: dayViews[0],dayViews[1],dayViews[2],dayViews[3],dayViews[4],dayViews[5],dayViews[6])
                
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[0])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[1])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[2])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[3])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[4])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[5])
                self.addConstraintsWithFormat("V:|[v0]|", views: dayViews[6])
            }

        }
    }
    
}
