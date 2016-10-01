import UIKit

class CCalendar:UIView,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    var dateIndexArray = [Int]()
    
    var delegate : CalendarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
        addSubview(collectionView)
        
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height), collectionViewLayout: layout)
        
        cv.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)

        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false;
        cv.showsVerticalScrollIndicator = false;
        cv.isPagingEnabled = true
        cv.alwaysBounceHorizontal = true;
        cv.alwaysBounceVertical = false;
        

        return cv
    }()
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateIndexArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CalendarView
        
        if let calDelegate = delegate{
            cell.delegate = calDelegate
        }
        
        if let current = currentDate{
            cell.CurrentDate = DateHelper.AddMonth(currDate: current, month: dateIndexArray[indexPath.item])
        }
        else{
            cell.CurrentDate = Date()
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
    var currentDate:Date?
    
    func showCalendar()
    {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        setupViews()
        
        collectionView.register(CalendarView.self, forCellWithReuseIdentifier: cellId)
        
        for i in -1000...1000
        {
            dateIndexArray.append(i)
        }
        
        self.collectionView.reloadData()
        
        self.collectionView.scrollToItem(at: IndexPath(item:1000,section:0), at: .left, animated: false)
        
        
        
    }
    
}
