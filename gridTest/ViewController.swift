//
//  ViewController.swift
//  gridTest
//
//  Created by 宗桓 李 on 2016/9/26.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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
        
//        let calendar = CCalendar(frame:CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height -  (navigationController?.navigationBar.frame.height)!))
        calendar.currentDate = Date()

        
        view.addSubview(calendar)

        view.addConstraintsWithFormat("H:|[v0]|",views:calendar)
        view.addConstraintsWithFormat("V:|[v0]|",views:calendar)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       calendar.showCalendar()
    }
    
}

