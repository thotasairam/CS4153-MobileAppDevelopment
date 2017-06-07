//
//  MyView.swift
//  W02_thota_saiRam
//
//  Created by Sai Ram Thota on 9/6/16.
//  Copyright © 2016 Sai Ram Thota. All rights reserved.
//

import UIKit

class MyView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let p = CGPoint( x: 10, y: 520 )
        
        let a = [NSForegroundColorAttributeName: UIColor.blue, NSObliquenessAttributeName: 1.0, NSFontAttributeName: UIFont(name: "Georgia-Bold", size: 34)!, NSParagraphStyleAttributeName: NSMutableParagraphStyle()] as [String : Any]
        
        
        let string = "Roll Dominoes" as NSString
        
        string.draw(at: p , withAttributes: a)
        
    }


}
