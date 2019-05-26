//
//  ViewController.swift
//  CareMind
//
//  Created by 임성주 on 26/05/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit
import SpinWheelControl

class ViewController: UIViewController, SpinWheelControlDataSource, SpinWheelControlDelegate {
    let colorPalette: [UIColor] = [UIColor.brown, UIColor.darkGray, UIColor.red, UIColor.orange, UIColor.black, UIColor.gray, UIColor.lightGray,]
    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedge = SpinWheelWedge()
        
        wedge.shape.fillColor = colorPalette[Int(index)].cgColor
        wedge.label.text = "Label #" + String(index)
        
        return wedge
    }
    
    var spinWheelControl: SpinWheelControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        spinWheelControl = SpinWheelControl(frame: frame, snapOrientation: .up, wedgeLabelOrientation: WedgeLabelOrientation.around)
        spinWheelControl.addTarget(self, action: #selector(spinWheelDidChangeValue), for: UIControl.Event.valueChanged)
        
        spinWheelControl.dataSource = self
        spinWheelControl.reloadData()
        
        spinWheelControl.delegate = self
        
        self.view.addSubview(spinWheelControl)
    }
    
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 7
    }
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        print("The spin wheel did end decelerating")
    }
    
    func spinWheelDidRotateByRadians(radians: Radians) {
        print("The wheel did rotate this many radians - " + String(describing: radians))
    }
    
    @objc func spinWheelDidChangeValue(sender: AnyObject) {
        print("Value changed to " + String(self.spinWheelControl.selectedIndex))
//        let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
//        self.present(uv!, animated: true)
    }
}

