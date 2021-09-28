//
//  BasePopupView.swift
//  FGPopupSchedulerDemo
//
//  Created by FoneG on 2021/9/27.
//

import Foundation
import UIKit
import FGPopupScheduler

class BasePopupView: UIView {
    
    init(des: String) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 300))

        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.init(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1).cgColor
        self.layer.shadowColor = UIColor.init(white: 0, alpha: 0.2).cgColor
        self.layer.shadowRadius = 4;
        self.layer.shadowOpacity = 1;
        self.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.layer.cornerRadius = 4;
        self.backgroundColor = .red
        
        let label = UILabel.init(frame: self.bounds)
        label.text = des
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func currentViewController() -> (UIViewController?) {
       let vc = UIApplication.shared.keyWindow?.rootViewController
       return currentViewController(vc)
    }


    func currentViewController(_ vc :UIViewController?) -> UIViewController? {
       if vc == nil {
          return nil
       }
       if let presentVC = vc?.presentedViewController {
          return currentViewController(presentVC)
       }
       else if let tabVC = vc as? UITabBarController {
          if let selectVC = tabVC.selectedViewController {
              return currentViewController(selectVC)
           }
           return nil
        }
        else if let naiVC = vc as? UINavigationController {
           return currentViewController(naiVC.visibleViewController)
        }
        else {
           return vc
        }
     }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss()
    }
    
}


extension BasePopupView : FGPopupView {
    
    func show(animation block: @escaping FGPopupViewAnimationBlock) {
        center = CGPoint.init(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        self.currentViewController()?.view?.addSubview(self)
    }
    
    func dismiss() {
        removeFromSuperview()
    }
}

