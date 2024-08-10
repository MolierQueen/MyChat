//
//  BaseViewController.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit
import SnapKit
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 如果启用了View controller-based status bar appearance，则需要实现此方法来返回状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // 或者 .darkContent，根据你的背景颜色选择
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
