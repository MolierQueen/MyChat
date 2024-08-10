//
//  FitstViewController.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit

class FitstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange

        self.title = "聊天"
        // 设置导航栏背景颜色
        navigationController?.navigationBar.backgroundColor = UIColor.red
        // 设置导航栏文字颜色
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let myviwe:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myviwe.backgroundColor = UIColor.gray
        self.view.addSubview(myviwe)
        
        
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return false // 返回 true 表示隐藏状态栏，false 表示显示状态栏
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
