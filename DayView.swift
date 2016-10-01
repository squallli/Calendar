import UIKit

class DayView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dayView:UILabel =
    {
            let labelTitle = UILabel()
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            labelTitle.text = DateHelper.getStringWithDayFormat(fromDate: self.CurrentDate!, formate: "dd")
            labelTitle.textAlignment = .center
            labelTitle.backgroundColor = UIColor.white
            labelTitle.font = UIFont.boldSystemFont(ofSize: 12)
            return labelTitle
    }()
    
    var CurrentDate:Date?{
        didSet{
            setupViews()
            self.setNeedsLayout()
            self.layoutIfNeeded()
            
            self.backgroundColor = UIColor.white
        }
    }
    
    
    
    func setupViews()
    {
        
        
        self.addSubview(dayView)
        
        self.addConstraintsWithFormat("V:|[v0(12)]", views: dayView)
        self.addConstraintsWithFormat("H:|[v0]|", views: dayView)
    }
    
    
}
