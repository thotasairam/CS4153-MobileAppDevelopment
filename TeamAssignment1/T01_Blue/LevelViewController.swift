//
//  LevelViewController.swift
//  T01_Blue
//
//  Created by Brandon Wong on 9/19/16.
//  Copyright © 2016 Brandon Wong. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var collision: UICollisionBehavior!
    var animator: UIDynamicAnimator!
    
    var playFieldImage:UIImage = #imageLiteral(resourceName: "EscapeGrid.png")

    var targetBlockImage:UIImage = #imageLiteral(resourceName: "red_square.png")
    var blockImage:UIImage = #imageLiteral(resourceName: "yellow_square.png")
    
    var blockArray:[BlockImageView] = []
    
    var level:Int = 1
    var moves:Int = 0
    
    @IBOutlet weak var playFieldImageView: UIImageView!
    
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playFieldImageView.image = playFieldImage
        movesLabel.text = "Moves: \(moves)"
        movesLabel.sizeToFit()
        movesLabel.center.x = self.view.center.x
        movesLabel.center.y = 155
        movesLabel.textColor = UIColor.white
        
        // Do any additional setup after loading the view.
        setUpLevel(level: level)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print("Collision - \(item1.description) with \(item2.description) at p.x, p.y")
    }
    
    @IBAction func previousLevel(_ sender: UIButton) {
        newLevel()
        level = level - 1
        moves = 0
        movesLabel.text = "Moves: \(moves)"
        setUpLevel(level: level)
    }
    
    @IBAction func nextLevel(_ sender: UIButton) {
        nextLevel()
    }

    func levelEnded() {
        let alertController = UIAlertController(title: "Level \(level) finished", message: "You have finished level \(level). Would you like to continue", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in self.nextLevel()}))
        self.present(alertController, animated: false, completion: nil)
    }
    
    func setUpLevel(level:Int) {
        switch level {
        case 1:
            blockArray = level1(playFieldImageView: playFieldImageView, levelController: self)
            backgroundImageView.image = #imageLiteral(resourceName: "EscapeLevelOne.png")
            backButton.isEnabled = false
        case 2:
            blockArray = level2(playFieldImageView: playFieldImageView, levelController: self)
            backgroundImageView.image = #imageLiteral(resourceName: "EscapeLevelTwo.png")
            backButton.isEnabled = true
            nextButton.isEnabled = true
        case 3:
            blockArray = level3(playFieldImageView: playFieldImageView, levelController: self)
            backgroundImageView.image = #imageLiteral(resourceName: "EscapeLevelThree.png")
            nextButton.isEnabled = false
        default:
            errorMessage(message: "Out of levels. Come back soon for more levels")
            mainMenu()
        }
        addBlocks()
    }
    
    func newLevel() {
        for blocks in blockArray {
            blocks.removeFromSuperview()
        }
        blockArray.removeAll()
    }
    
    func nextLevel() {
        // Start Segue into next level.
        newLevel()
        level = level + 1
        moves = 0
        movesLabel.text = "Moves: \(moves)"
        setUpLevel(level: level)
        
    }
    
    func addBlocks() {
        for blocks in blockArray {
            self.view.addSubview(blocks)
        }
    }
    
    func errorMessage(message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: false, completion: nil)
    }
    
   func level1(playFieldImageView: UIView, levelController:LevelViewController) -> [BlockImageView] {
    
            var arrayOfBlocks:[BlockImageView] = []
            
            let blockImageView = BlockImageView(x: 2, y: 0, length: 3, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 0")
    
            let blockImageView1 = BlockImageView(x: 3, y: 0, length: 3, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 1")
            
            let blockImageView2 = BlockImageView(x: 2, y: 3, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 2")
    
            let blockImageView3 = BlockImageView(x: 0, y: 3, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 3")
    
            let blockImageView4 = BlockImageView(x: 4, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 4")
    
            let blockImageView5 = BlockImageView(x: 5, y: 3, length: 3, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 5")
    
            let blockImageView6 = BlockImageView(x: 0, y: 5, length: 3, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 6")
    
            let targetBlock = BlockImageView(x: 0, y: 2, length: 2, orientation: BlockImageView.horizontal, displayImage: targetBlockImage, levelView: playFieldImageView, levelController: levelController, name:"Target Block")
            
            // Adds the blocks into the the array
    
            arrayOfBlocks.append(targetBlock)
    
            arrayOfBlocks.append(blockImageView)
            arrayOfBlocks.append(blockImageView1)
            arrayOfBlocks.append(blockImageView2)
            arrayOfBlocks.append(blockImageView3)
    
            arrayOfBlocks.append(blockImageView4)
            arrayOfBlocks.append(blockImageView5)
            arrayOfBlocks.append(blockImageView6)
    
            return arrayOfBlocks
            
    }

    func level2(playFieldImageView: UIView, levelController:LevelViewController) -> [BlockImageView] {
    
        var arrayOfBlocks:[BlockImageView] = []
        
        let targetBlock = BlockImageView(x: 2, y: 2, length: 2, orientation: BlockImageView.horizontal, displayImage: targetBlockImage, levelView: playFieldImageView, levelController: levelController, name:"Target Block")
    
        // Blocks
        let blockImageView = BlockImageView(x: 0, y: 0, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 0")
    
        let blockImageView1 = BlockImageView(x: 2, y: 0, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 1")
    
        let blockImageView2 = BlockImageView(x: 3, y: 0, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 2")
        
        let blockImageView3 = BlockImageView(x: 5, y: 0, length: 3, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 3")
        
        let blockImageView4 = BlockImageView(x: 4, y: 1, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 4")
        
        let blockImageView5 = BlockImageView(x: 0, y: 2, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 5")
        
        let blockImageView6 = BlockImageView(x: 2, y: 3, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 6")
        
        let blockImageView7 = BlockImageView(x: 4, y: 3, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 7")
        
        let blockImageView8 = BlockImageView(x: 0, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 8")
        
        let blockImageView9 = BlockImageView(x: 1, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 9")
        
        let blockImageView10 = BlockImageView(x: 3, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 10")
        
        let blockImageView11 = BlockImageView(x: 4, y: 4, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 11")
        
        let blockImageView12 = BlockImageView(x: 4, y: 5, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 12")

        
    
        // Adds the blocks into the the array
        
        arrayOfBlocks.append(targetBlock)
        
        arrayOfBlocks.append(blockImageView)
        arrayOfBlocks.append(blockImageView1)
        arrayOfBlocks.append(blockImageView2)
        arrayOfBlocks.append(blockImageView3)
        arrayOfBlocks.append(blockImageView4)
        arrayOfBlocks.append(blockImageView5)
        arrayOfBlocks.append(blockImageView6)
        arrayOfBlocks.append(blockImageView7)
        arrayOfBlocks.append(blockImageView8)
        arrayOfBlocks.append(blockImageView9)
        arrayOfBlocks.append(blockImageView10)
        arrayOfBlocks.append(blockImageView11)
        arrayOfBlocks.append(blockImageView12)
        

    
        return arrayOfBlocks
    
    }
    
    func level3(playFieldImageView: UIView, levelController:LevelViewController) -> [BlockImageView] {
        
        var arrayOfBlocks:[BlockImageView] = []
        
        let targetBlock = BlockImageView(x: 2, y: 2, length: 2, orientation: BlockImageView.horizontal, displayImage: targetBlockImage, levelView: playFieldImageView, levelController: levelController, name:"Target Block")
        
        // Blocks
        let blockImageView = BlockImageView(x: 0, y: 0, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 0")
        
        let blockImageView1 = BlockImageView(x: 2, y: 0, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 1")
        
        let blockImageView2 = BlockImageView(x: 3, y: 0, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 2")
        
        let blockImageView3 = BlockImageView(x: 5, y: 0, length: 3, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 3")
        
        let blockImageView4 = BlockImageView(x: 4, y: 1, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 4")
        
        let blockImageView5 = BlockImageView(x: 0, y: 2, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 5")
        
        let blockImageView6 = BlockImageView(x: 2, y: 3, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 6")
        
        let blockImageView7 = BlockImageView(x: 4, y: 3, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 7")
        
        let blockImageView8 = BlockImageView(x: 0, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 8")
        
        let blockImageView9 = BlockImageView(x: 1, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 9")
        
        let blockImageView10 = BlockImageView(x: 3, y: 4, length: 2, orientation: BlockImageView.vertical, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 10")
        
        let blockImageView11 = BlockImageView(x: 4, y: 4, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 11")
        
        let blockImageView12 = BlockImageView(x: 4, y: 5, length: 2, orientation: BlockImageView.horizontal, displayImage: blockImage, levelView: playFieldImageView, levelController: levelController, name:"Block 12")
        
        
        
        // Adds the blocks into the the array
        
        arrayOfBlocks.append(targetBlock)
        
        arrayOfBlocks.append(blockImageView)
        arrayOfBlocks.append(blockImageView1)
        arrayOfBlocks.append(blockImageView2)
        arrayOfBlocks.append(blockImageView3)
        arrayOfBlocks.append(blockImageView4)
        arrayOfBlocks.append(blockImageView5)
        arrayOfBlocks.append(blockImageView6)
        arrayOfBlocks.append(blockImageView7)
        arrayOfBlocks.append(blockImageView8)
        arrayOfBlocks.append(blockImageView9)
        arrayOfBlocks.append(blockImageView10)
        arrayOfBlocks.append(blockImageView11)
        arrayOfBlocks.append(blockImageView12)
        
        
        
        return arrayOfBlocks
        
    }


    func mainMenu() {
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "mainMenu")
        self.present(nextViewController!, animated: true, completion: nil)
    }
    
    



    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
