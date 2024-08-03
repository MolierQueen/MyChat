//
//  CommonConfig.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit


/// 屏幕宽
public var SCREEN_WIDTH: Int {
    if #available(iOS 13.0, *) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let screen = windowScene.screen
            return Int(screen.bounds.size.width)
        }
    } else {
        return Int(UIScreen.main.bounds.width)
    }
    return 0
}

/// 屏幕高
public var SCREEN_HEIGHT: Int {
    if #available(iOS 13.0, *) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let screen = windowScene.screen
            
            return Int(screen.bounds.size.height)
        }
    } else {
        return Int(UIScreen.main.bounds.height)
        // Fallback on earlier versions
    }
    return 0
}

/// 顶部安全区域
public var SAFE_TOP : Int {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return Int(window.safeAreaInsets.top)
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return Int(window.safeAreaInsets.top)
    }
    return 0;
}

/// 底部安全区域
public var SAFE_BOTTOM : Int {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return Int(window.safeAreaInsets.bottom)
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return Int(window.safeAreaInsets.bottom)
    }
    return 0;
}

/// 状态栏高度
public var STATUS_BAR_HEIGHT : Int {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0 }
        statusBarHeight = statusBarManager.statusBarFrame.height
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return Int(statusBarHeight)
}

/// 导航栏高度(不包括状态栏)
public var NAVIGATION_BAR_HEIGHT : Int {
    return 44
}

/// 导航栏总高度
public var ALL_NAVIGATION_BAR_HEIGHT : Int {
    return STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT
}

/// tabbar高度（不包括下边安全区域）
public var TAB_BAR_HEIGH : Int {
    return 49
}

/// tabbar总高度
public var ALL_TAB_BAR_HEIGHT : Int {
    return TAB_BAR_HEIGH + SAFE_BOTTOM
}


public class CommonConfig: NSObject {
}
