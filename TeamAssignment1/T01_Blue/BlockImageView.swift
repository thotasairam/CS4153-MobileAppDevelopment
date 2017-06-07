//
//  BlockImageView.swift
//  T01_Blue
//
//  Created by Brandon Wong on 9/17/16.
//  Copyright © 2016 Brandon Wong. All rights reserved.
//

import UIKit

class BlockImageView: UIImageView, UICollisionBehaviorDelegate {
    static let vertical:Int = 0
    static let horizontal:Int = 1
    
    //    var grid = LevelViewController().grid
    
    var x:Int
    var y:Int
    var length:Int
    var orientation:Int
    var displayImage:UIImage
    var levelView:UIView
    var levelController:LevelViewController
    var name:String
    var gridPosition:[(x:Int, y:Int)] = []
    
    
    // Test
    //    var animator:UIDynamicAnimator!
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    init(x:Int, y:Int, length:Int, orientation:Int, displayImage:UIImage, levelView:UIView, levelController:LevelViewController, name:String) {
        self.x = x // Can be 0-5
        self.y = y // Can be 0-5
        self.length = length   // Cannot be zero.
        self.orientation = orientation // Specified by BlockImageView.horizontal or vertical
        self.displayImage = displayImage
        self.levelView = levelView  // the parent playing field UIView
        self.levelController = levelController
        self.name = name
        
        super.init(image: displayImage)
        
        // Changing visual aspects of block
        self.isUserInteractionEnabled = true;
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 12.0
        
        // Calculate the actual origin point given the grid coordinates on the 6x6 grid
        let originx = (CGFloat(x)*((levelView.frame.width-2)/6))+1+levelView.frame.origin.x
        let originy = (CGFloat(y)*(levelView.frame.height/6))+levelView.frame.origin.y
        var height:CGFloat
        var width:CGFloat
        
        // Sets the height and width of the block based on the information inputted.
        if(orientation == BlockImageView.horizontal) {
            height = (CGFloat(1)*((levelView.frame.height-6)/6))
            width = (CGFloat(length)*((levelView.frame.width-8)/6))
        } else {
            height = (CGFloat(length)*((levelView.frame.height-6)/6))
            width = (CGFloat(1)*((levelView.frame.width-8)/6))
        }
        
        self.frame = CGRect(x: originx, y: originy, width: width, height: height)
        
        // Register a Pan Gesture Recongizer in every block.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(BlockImageView.panHandler(_:)))
        self.addGestureRecognizer(panGesture)
        
        
    }
    
    @IBAction func panHandler(_ sender: UIPanGestureRecognizer) {
        //print("Touched")
        
        let distance = sender.translation(in: self)
        
        if let view = sender.view {
            
            
            let height = levelView.frame.size.height
            let width = levelView.frame.size.width
            
            let blockHeight = view.frame.size.height/2
            let blockWidth = view.frame.size.width/2
            
            let gridHeight = height/6
            let gridWidth = (width-2)/6
            
            let originX = levelView.frame.origin.x
            let originY = levelView.frame.origin.y
            let bottomX = originX + width
            let bottomY = originY + height
            let pointX = view.center.x+distance.x
            let pointY = view.center.y+distance.y
            
            let epsilon:CGFloat = CGFloat(14) // Sensitivity of the block movement
            
            
            // Checks to see if the block is within the playing field before moving.
            if (((pointX+blockWidth) > (bottomX+epsilon)) ||
                ((pointX-blockWidth) < (originX-epsilon)) ||
                ((pointY+blockHeight) > (bottomY+epsilon)) ||
                ((pointY-blockHeight) < (originY-epsilon))) {
                
                // TODO: Check and see if the block is out
                //print("Point X: \(pointX), Point Y: \(pointY)")
                
                if((pointX+blockWidth) > bottomX && name == "Target Block") {
                    view.center = CGPoint(x:view.center.x + 10*distance.x, y:view.center.y)
                    sender.setTranslation(CGPoint.zero, in: self)
                    levelController.levelEnded()
                }
                
            } else {
                if((view as! BlockImageView).orientation == BlockImageView.horizontal) {
                    if((distance.x >= gridWidth-epsilon)) {
                        view.center = CGPoint(x:view.center.x + gridWidth, y:view.center.y)
                        if(checkForIntersection(block: view as! BlockImageView)) {
                            view.center = CGPoint(x:view.center.x - gridWidth, y: view.center.y)
                        }
                        sender.setTranslation(CGPoint.zero, in: self)
                        
                    
                    } else if((distance.x <= (-1*gridWidth)+epsilon+7) ) {
                        view.center = CGPoint(x:view.center.x - gridWidth, y:view.center.y)
                        if(checkForIntersection(block: view as! BlockImageView)) {
                            view.center = CGPoint(x:view.center.x + gridWidth, y: view.center.y)
                        }
                        sender.setTranslation(CGPoint.zero, in: self)
                        
                    }
                } else {
                    if((distance.y >= gridHeight-epsilon)) {
                        view.center = CGPoint(x:view.center.x, y:view.center.y+gridHeight)
                        if(checkForIntersection(block: view as! BlockImageView)) {
                            view.center = CGPoint(x:view.center.x, y: view.center.y-gridHeight)
                        }
                        sender.setTranslation(CGPoint.zero, in: self)
                       
                    } else if((distance.y <= (-1*gridHeight)+epsilon+7) ) {
                        view.center = CGPoint(x:view.center.x, y:view.center.y-gridHeight)
                        if(checkForIntersection(block: view as! BlockImageView)) {
                            view.center = CGPoint(x:view.center.x, y: view.center.y+gridHeight)
                        }
                        sender.setTranslation(CGPoint.zero, in: self)
                        
                    }
                }
            }
            if(sender.state == UIGestureRecognizerState.began) {
                gridPosition = positionInGrid()
            }
            if (sender.state == UIGestureRecognizerState.ended) {
                if(gridPosition[0] != positionInGrid()[0]) {
                    addMove()
                }
            }
        }
    }
    func checkForIntersection(block:BlockImageView) -> Bool {
        for blocks in levelController.blockArray {
            if(block != blocks && block.frame.intersects(blocks.frame)) {
                return true
            }
        }
        return false
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .rectangle
    }
    
    func addMove() {
        levelController.moves = levelController.moves + 1
        levelController.movesLabel.text = "Moves: \(levelController.moves)"
        levelController.movesLabel.sizeToFit()
        levelController.movesLabel.center.x = levelController.view.center.x
    }
    
    func positionInGrid() -> ([(x:Int, y:Int)]){
        
        var gridPositions:[(x:Int, y:Int)] = []
        
        let x:CGFloat = self.center.x - (self.frame.width/2)
        let y:CGFloat = self.center.y - (self.frame.height/2)
        
        let gridX:Int = (Int)((x - self.levelView.frame.origin.x) / ((self.levelView.frame.width-6)/6))
        let gridY:Int = (Int)((y - self.levelView.frame.origin.y) / ((self.levelView.frame.height-6)/6))
        
        for i in 0..<self.length {
            if(self.orientation == BlockImageView.horizontal) {
                gridPositions.append((x:gridX+i, y:gridY))
            } else {
                gridPositions.append((x:gridX, y:gridY+i))
            }
        }
        return gridPositions
    }
    
    // To check if moved position is out.
    func positionInGrid(x:CGFloat, y:CGFloat) -> [(Int, Int)] {
        var gridPositions:[(x:Int, y:Int)] = []
        
        let x:CGFloat = x - (self.frame.width/2)
        let y:CGFloat = y - (self.frame.height/2)
        
        let gridX:Int = (Int)((x - self.levelView.frame.origin.x) / ((self.levelView.frame.width-6)/6))
        let gridY:Int = (Int)((y - self.levelView.frame.origin.y) / ((self.levelView.frame.height-6)/6))
        
        for i in 0..<self.length {
            if(self.orientation == BlockImageView.horizontal) {
                gridPositions.append((x:gridX+i, y:gridY))
            } else {
                gridPositions.append((x:gridX, y:gridY+i))
            }
        }
        return gridPositions
        
    }
    
    func printGrid(gridPositions:[(x:Int, y:Int)]) {
        print("Grid positions for Block: \(name)")
        
        for j in 0..<gridPositions.count {
            print("X: \(gridPositions[j].x), Y: \(gridPositions[j].y)")
        }
        print("\n")
    }
    
    // Checks to see if the grid is within the grid
    func checkGrid(gridPosition: [(x:Int, y:Int)]) -> Bool {
        for k in 0..<gridPosition.count {
            if(gridPosition[k].x < 0 || gridPosition[k].x > 5 ||
                gridPosition[k].y < 0 || gridPosition[k].y > 5) {
                return false
            }
        }
        return true
    }
    
    func round(number:CGFloat) -> Int {
        let numberInt:Int = Int(number)
        if((number - CGFloat(numberInt)) < 0.5) {
            return numberInt
        } else {
            return numberInt + 1
        }
    }
    
    func snapToGrid(view:UIView) {
        
        if((view as! BlockImageView).orientation == BlockImageView.horizontal) {
            let gridWidth = (self.levelView.frame.width-6)/6
            let gridX:Int = round(number: (view.center.x - self.levelView.frame.origin.x) / gridWidth)
            let blockWidthFromCenter = self.frame.width/2
            if(gridX < 0) {
                view.center = CGPoint(x: self.levelView.frame.origin.x + blockWidthFromCenter + 3, y: view.center.y)
            } else if (gridX > 5) {
                view.center = CGPoint(x: self.levelView.frame.origin.x + (CGFloat(5) * gridWidth) - blockWidthFromCenter - 3, y: view.center.y)
            } else {
                view.center = CGPoint(x: self.levelView.frame.origin.x + (CGFloat(gridX) * gridWidth), y: view.center.y)
            }
        } else {
            let gridHeight = (self.levelView.frame.height-6)/6
            let gridY:Int = round(number: (view.center.y - self.levelView.frame.origin.y) / gridHeight)
            let blockHeightFromCenter = self.frame.height/2
            
            if(gridY < 0) {
                view.center = CGPoint(x: view.center.x, y: self.levelView.frame.origin.y + blockHeightFromCenter + 3)
            } else if(gridY > 5) {
                view.center = CGPoint(x: view.center.x, y: self.levelView.frame.origin.y + (CGFloat(5) * gridHeight) - blockHeightFromCenter - 3)
            } else {
                view.center = CGPoint(x: view.center.x, y: self.levelView.frame.origin.y + (CGFloat(gridY) * gridHeight))
            }
            
        }
        
    }
    
}
