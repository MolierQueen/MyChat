//
//  NHLocation.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/10.
//

import UIKit
import CoreLocation
class NHLocation: NSObject,CLLocationManagerDelegate {
    static let shared = NHLocation()
    
    typealias LocationResult = (_ error: Error?, _ latitude:Double, _ longitude:Double) -> Void
    
    var myLocationResult:LocationResult?
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    private override init() {
    }
    
    func requestLoaction(result:@escaping LocationResult) -> Void {
        // 初始化 CLLocationManager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 请求用户权限
        locationManager.requestWhenInUseAuthorization()
        myLocationResult = result
        locationManager.delegate = NHLocation.shared
        // 开始更新位置信息
        locationManager.startUpdatingLocation()
    }
    
    // CLLocationManagerDelegate 方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 获取最新的位置
        if let location = locations.last, myLocationResult != nil  {
            myLocationResult!(nil, location.coordinate.latitude, location.coordinate.longitude)
            print("我的位置是  : \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        myLocationResult!(error, 0.0, 0.0)
        locationManager.stopUpdatingLocation()
    }
}
