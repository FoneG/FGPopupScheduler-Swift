//
//  ViewController.swift
//  FGPopupSchedulerDemo
//
//  Created by FoneG on 2021/9/27.
//

import UIKit
import FGPopupScheduler

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        insertPopViews()
    }
    
    func insertPopViews() {
        scheduler.isSuspended = true
        scheduler.add(BasePopupView.init(des: "first PopView"), priority: FGPopupStrategyPriorityHigh)
        scheduler.add(BasePopupView.init(des: "second PopView"), priority: FGPopupStrategyPriorityLow)
        scheduler.add(BasePopupView.init(des: "third PopView"), priority: FGPopupStrategyPriorityHigh)
        scheduler.isSuspended = false
    }
    
    var scheduler = FGPopupScheduler.init(strategy: .priority)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

