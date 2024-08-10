//
//  CustomTabBarController.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit
class CustomTabBarController: UITabBarController {

    var myVCs:[BaseViewController] = []
    
    let barView = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT - ALL_TAB_BAR_HEIGHT, width: Int(SCREEN_WIDTH), height: ALL_TAB_BAR_HEIGHT))
    
    var tabbarItems:[TabbarButton] = []
    
    var defaultIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeSystmeTabbarView()
        configView()
    }
    
    deinit {
        print("销毁\(self)")
    }
    
    func configView() -> Void {
        barView.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.addSubview(barView)
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
    
    // MARK: - 系统函数
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        self.selectedIndex = defaultIndex
        guard let myVCs = viewControllers else { return }
        let buttonLeft = (SCREEN_WIDTH - (myVCs.count * tabbarButtonWidth)) / (myVCs.count + 1)
        for (index, vc) in myVCs.enumerated() {
            
            let button = TabbarButton(title: vc.tabBarItem.title!, image: vc.tabBarItem.image!, selectImage: vc.tabBarItem.selectedImage!, tag: .ButtonTypeChat) { [weak self]  tag in
                guard let self = self else { return }
                self.tabbarItems.forEach({ button in
                    button.deSelected()
                })
                self.selectedIndex = index
            }
            if index == defaultIndex {
                button.selected()
            }
            tabbarItems.append(button)
            self.barView.addSubview(button)
            button.snp.remakeConstraints { make in
                make.bottom.equalTo(self.barView).offset(-SAFE_BOTTOM+10)
                make.width.equalTo(tabbarButtonWidth)
                make.height.equalTo(tabbarButtonHeight)
                make.leading.equalTo(buttonLeft + (buttonLeft + tabbarButtonWidth) * index)
            }
        }
    }
}
