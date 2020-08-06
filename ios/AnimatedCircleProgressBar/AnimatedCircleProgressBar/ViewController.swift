//
//  ViewController.swift
//  AnimatedCircleProgressBar
//
//  Created by paulo on 31/07/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // create track layer
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        
        // circle border
        trackLayer.lineWidth = 10
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.fillColor = UIColor.clear.cgColor
        
        // let's start by drawing a circle somehow
        shapeLayer.path = circularPath.cgPath
        
        // circle border
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }

}

