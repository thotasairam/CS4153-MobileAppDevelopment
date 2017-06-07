//
//  Block.swift
//  T01_Blue
//
//  Created by Brandon Wong on 9/17/16.
//  Copyright © 2016 Brandon Wong. All rights reserved.
//

import UIKit

class Block: NSObject {
    var x:Int = 0
    var y:Int = 0
    var length:Int = 0
    var color:CGColor = UIColor(red:100.0, green: 130.0, blue:230.0, alpha:1.0).cgColor
    
    init(x: Int, y: Int, length:Int, color:CGColor) {
        self.x = x
        self.y = y
        self.length = length
        self.color = color
    }
    
    
    
    
    
}
