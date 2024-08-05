//
//  AppDelegate.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstNav = UINavigationController(rootViewController: FitstViewController())
        firstNav.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "tab_album"), selectedImage: UIImage(named: "tab_album"))
        
        let secondNav = UINavigationController(rootViewController: SecondViewController())
        secondNav.tabBarItem = UITabBarItem(title: "Album", image: UIImage(named: "tab_album"), selectedImage: UIImage(named: "tab_album"))

        let thirdNav = UINavigationController(rootViewController: ThirdViewController())
        thirdNav.tabBarItem = UITabBarItem(title: "My", image: UIImage(named: "tab_album"), selectedImage: UIImage(named: "tab_album"))

        
        let mainTabVC = CustomTabBarController()
        mainTabVC.viewControllers = [firstNav, secondNav, thirdNav]
        
        window.rootViewController = mainTabVC
        window.makeKeyAndVisible()
        return true
    }
}

