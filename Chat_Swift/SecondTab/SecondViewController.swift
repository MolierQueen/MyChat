//
//  SecondViewController.swift
//  Chat_Swift
//
//  Created by molier on 2024/8/3.
//

import UIKit
import MapKit

class SecondViewController: BaseViewController {

    let mapView:MKMapView = MKMapView.init()
    
    let cities = [
        ("北京", 39.9042, 116.4074),
        ("天津", 39.3434, 117.3616),
        ("深圳", 22.5431, 114.0579),
        ("广州", 23.1291, 113.2644),
        ("清迈", 18.7883, 98.9853),
        ("芭提雅", 12.9236, 100.8825),
        ("哥打基纳巴卢", 5.9804, 116.0735),
        ("仙本那", 4.4827, 118.6112),
        ("梵蒂冈", 41.9029, 12.4534),
        ("布拉格", 50.0755, 14.4378),
        ("纽约", 40.7128, -74.0060),
        ("旧金山", 37.7749, -122.4194),
        ("圣何塞", 37.3382, -121.8863)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        mapView.delegate = self
        // 初始化地图视图并添加到视图中
        self.view.addSubview(mapView)
        mapView.snp.remakeConstraints { make in
            make.top.equalTo(ALL_NAVIGATION_BAR_HEIGHT)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(300)
        }
        
        
        NHLocation.shared.requestLoaction { [weak self] error, latitude, longitude in 
            guard let self = self else {
                return
            }
            let worldRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 360)
            )
            self.mapView.setRegion(worldRegion, animated: true)
        }
//        drawRoute()
        multiPoind_mark()
        multiPoint_line()
    }
    func multiPoint_line() -> Void {
        var marks = [CLLocationCoordinate2D]()
        for city in cities {
            marks.append(CLLocationCoordinate2D(latitude: city.1, longitude: city.2))
        }
        
        // 创建 MKPolyline
        let polyline = MKPolyline(coordinates: marks, count: marks.count)
        mapView.addOverlay(polyline)
    }
    
    func multiPoind_mark() -> Void {
        // 创建并设置 MKPointAnnotation
        // 标注城市的坐标
        // 创建标注点并添加到地图
        var marks = [MKPointAnnotation]()
        for city in cities {
            let annotation = MKPointAnnotation()
            annotation.title = city.0
            annotation.coordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
            marks.append(annotation)
        }
        
        // 添加标注到地图
        mapView.addAnnotations(marks)
        
        
        // 手动计算地图区域
        // 计算所有标注点的边界框
         var zoomRect = MKMapRect.null
         for annotation in marks {
             let annotationPoint = MKMapPoint(annotation.coordinate)
             let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
             zoomRect = zoomRect.union(pointRect)
         }
        
        // 设置地图区域显示
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
            self.mapView.showAnnotations(marks, animated: true)
        }
    
    }
    
    func drawRoute() {
        // 定义起点和终点
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // 例如: 旧金山
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437) // 例如: 洛杉矶
        
        // 创建 MKPlacemark 对象
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        
        // 创建 MKMapItem 对象
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 创建 MKDirectionsRequest 对象
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = sourceMapItem
        directionsRequest.destination = destinationMapItem
        directionsRequest.transportType = .automobile // 交通类型：步行、开车等
        
        // 创建 MKDirections 对象以计算路线
        let directions = MKDirections(request: directionsRequest)
        directions.calculate { response, error in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            // 获取最优路径
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline) // 将路径添加到地图上
            
            // 调整地图视图以适应路径
            
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
    }

}

// 扩展 ViewController 以符合 MKMapViewDelegate 协议
extension SecondViewController: MKMapViewDelegate {
    // 渲染路径
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 2.0
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
    // 渲染点
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let identifier = "DefaultAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.pinTintColor = .red
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }
}
