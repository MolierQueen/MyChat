//
//  CustomTabBarController+Button.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import Foundation
import UIKit

let space = 0
let tabbarButtonWidth = 50
let tabbarButtonHeight = 60

class TabbarButton : UIView {
    
    enum ButtonType:Int {
        case ButtonTypeDefalut = 0
        case ButtonTypeChat = 1
        case ButtonTypePhoto = 2
        case ButtonTypeUser = 3
    }
    
    typealias ButtonACction = ((_ tag:ButtonType)->Void)
    var buttonTitle = ""
    var barImage = UIImage()
    var barSelectImage = UIImage()
    var action:ButtonACction?
    var currentButtonTag:ButtonType = .ButtonTypeDefalut

    var imageView = UIImageView.init()
    var titleLabel = UILabel.init()
    
    
    init(title:String, image:UIImage, selectImage:UIImage, tag:ButtonType,  onTapAction:@escaping ButtonACction) {
        super.init(frame: CGRect.zero)
        buttonTitle = title
        barImage = image
        barSelectImage = selectImage
        action = onTapAction
        currentButtonTag = tag
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tap)
        
        self.configButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configButton() -> Void {
        self.addSubview(imageView)
        imageView.image = barImage
        imageView.snp.remakeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.top)
        }
        
        self.addSubview(titleLabel)
        titleLabel.text = buttonTitle
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.snp.remakeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(space)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    @objc func tapAction() -> Void {
        guard let myAction = action else { return }
        myAction(currentButtonTag)
        selected()
    }
    
    func selected() -> Void {
        imageView.image = barImage
        imageView.snp.remakeConstraints { make in
            make.width.height.equalTo(70)
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(-10)
        }
        titleLabel.isHidden = true
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn) {
            self.layoutIfNeeded()
        }
    }
    
    func deSelected() -> Void {
        imageView.image = barImage
        imageView.snp.remakeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.top)
        }
        titleLabel.isHidden = false
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn) {
            self.layoutIfNeeded()
        }
    }
}

extension CustomTabBarController {
}
