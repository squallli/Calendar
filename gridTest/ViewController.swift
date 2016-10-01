
import UIKit

class ViewController: UIViewController,CalendarDelegate {

    let calendar = CCalendar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "行事曆"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
  
        view.backgroundColor = UIColor.black
        
        calendar.delegate = self

        calendar.currentDate = Date()

        view.addSubview(calendar)

        view.addConstraintsWithFormat("H:|[v0]|",views:calendar)
        view.addConstraintsWithFormat("V:|[v0]|",views:calendar)
        
    }
    
    func getDayCount(day:Int) -> Double
    {
        return Double(day * 8640 * 1000)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       calendar.showCalendar()
    }
    
    func calendar(dayView:DayView,date:Date) -> DayView
    {
        if DateHelper.getStringWithDayFormat(fromDate: date, formate: "yyyy/MM/dd").compare(DateHelper.getStringWithDayFormat(fromDate: Date(), formate: "yyyy/MM/dd")) == ComparisonResult.orderedSame
        {
            dayView.backgroundColor = UIColor(white: 0.8, alpha: 1)
            let v = UILabel()
            v.text = "磨菇餐"
            v.backgroundColor = UIColor.red
            v.textColor = UIColor.white
            v.textAlignment = .center
            v.font = UIFont.boldSystemFont(ofSize: 14)
            
            let v1 = UILabel()
            v1.text = "雞肉飯"
            v1.backgroundColor = UIColor.blue
            v1.textColor = UIColor.white
            v1.textAlignment = .center
            v1.font = UIFont.boldSystemFont(ofSize: 14)
            
            dayView.addSubview(v)
            dayView.addSubview(v1)
            
            dayView.addConstraintsWithFormat("H:|-2-[v0]-2-|", views: v)
            dayView.addConstraintsWithFormat("H:|-2-[v0]-2-|", views: v1)
            dayView.addConstraintsWithFormat("V:|-13-[v0(15)]-2-[v1(15)]", views: v,v1)
            
        }
        return dayView
    }
    
}

