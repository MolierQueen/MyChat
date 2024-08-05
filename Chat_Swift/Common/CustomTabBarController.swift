//
//  CustomTabBarController.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit
class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        removeSystmeTabbarView()
        
        configView()
    }
    
    func configView() -> Void {
        let barView = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT - ALL_TAB_BAR_HEIGHT, width: Int(SCREEN_WIDTH), height: ALL_TAB_BAR_HEIGHT))
        barView.backgroundColor = UIColor.red
        view.addSubview(barView)
    }
    
    // MARK: - 配置VC
    func configVCs(vcs:[BaseViewController]) -> Void {
        let count = vcs.count
        let width = SCREEN_WIDTH / 3
        
        
        
        for (index, vc) in vcs.enumerated() {
            if let myVc:BaseViewController = vc as? BaseViewController {
                
                
                
            }
        }
        
    }
    
    
    
    

}





extension CustomTabBarController {
    // MARK: - 移除系统的Tabbar
    func removeSystmeTabbarView() -> Void {
        for view in view.subviews {
            if view.isKind(of: UITabBar.self) {
                view.isHidden = true
                break
            }
        }
    }
}
