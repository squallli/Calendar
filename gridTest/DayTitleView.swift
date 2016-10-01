import UIKit

class DayTitleView: UIView
{
    var title :String? = nil
    var titleColor:UIColor?
    
    init(frame: CGRect,titleText:String,TitleColor:UIColor) {
        super.init(frame: frame)
        
        title = titleText
        titleColor = TitleColor
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
        self.addSubview(dayTitleView)
        
        addConstraintsWithFormat("V:|[v0]|", views: dayTitleView)
        addConstraintsWithFormat("H:|[v0]|", views: dayTitleView)
        
    }
    
    
    lazy var dayTitleView:UILabel =
    {
        let labelTitle = UILabel()
            labelTitle.backgroundColor = UIColor.white
            labelTitle.textColor = self.titleColor
            labelTitle.text = self.title
            labelTitle.textAlignment = .center
            labelTitle.font = UIFont(name: "HelveticaNeue", size: 12)
            return labelTitle
    }()
}

