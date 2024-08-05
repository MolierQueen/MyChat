//
//  CustomTabBarController+Button.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import Foundation
import UIKit
class TabbarButton : UIView {
    var barImage = UIImage(named: "")
    var barSelectImage = UIImage(named: "")
    var title = ""
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configButton() -> Void {
        let button : UIButton = UIButton(type: .custom)
        button.backgroundColor = .yellow
        button.frame = self.frame
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        print("subview")
    }
    
}


extension CustomTabBarController {
}
