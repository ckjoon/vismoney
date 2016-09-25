//
//  Third.swift
//  
//
//  Created by Yeon Joon Choi on 9/25/16.
//
//


import UIKit

class Third: UIViewController {
    var shark_number = 5
    var fish_number = 3
    var red_number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background_1.png")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        //Draw fishes
        Draw(shark_number, image: "shark.png", inverted: "shark-inverted.png", size_fish: 130, stop: 0)
        Draw(red_number, image: "red.png", inverted: "red-inverted.png", size_fish: 70, stop: 0)
        Draw(fish_number, image: "fish.png", inverted: "fish-inverted.png", size_fish: 40, stop: 0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func Draw(number: Int, image: String, inverted: String, size_fish: Int, stop: Int) {
        
        //Setup the bounds
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        //        print(screenWidth)
        
        for loop in 0...number {
            
            // set up some constants for the animation
            let duration = NSTimeInterval(arc4random_uniform(10)+5)
            let delay = NSTimeInterval(0 + arc4random_uniform(1000)) / 1000
            
            // set up some constants for the fish
            
            let size : CGFloat = CGFloat(size_fish)
            let start_Height = UInt32(ceil(0.6*screenHeight))
            let yPosition : CGFloat = CGFloat( arc4random_uniform(start_Height)) + (0.4*screenHeight)
            
            // create the fish and add it to the screen
            let fish = UIImageView()
            
            let flag = Int(arc4random_uniform(2))
            if(stop==0) {
                if flag == 0
                {
                    fish.image = UIImage(named: inverted)
                    fish.frame = CGRectMake(0-15, yPosition, size, size+10)
                    self.view.addSubview(fish)
                    
                    // define the animation
                    UIView.animateWithDuration(duration, delay: delay, options: [.CurveEaseIn, .Repeat], animations: {
                        
                        // move the fish
                        fish.frame = CGRectMake(screenWidth+15, yPosition, size, size+10)
                        
                        }, completion: { animationFinished in
                            
                            // remove the fish
                            fish.removeFromSuperview()
                    })
                }
                else
                {
                    fish.image = UIImage(named: image)
                    fish.frame = CGRectMake(screenWidth+15, yPosition, size, size+10)
                    self.view.addSubview(fish)
                    // define the animation
                    UIView.animateWithDuration(duration, delay: delay, options: [.CurveEaseIn, .Repeat], animations: {
                        
                        // move the fish
                        fish.frame = CGRectMake(0-15, yPosition, size, size+10)
                        
                        }, completion: { animationFinished in
                            
                            // remove the fish
                            fish.removeFromSuperview()
                    })
                }
            }
            else {
                fish.image = UIImage(named: inverted)
                fish.frame = CGRectMake(0-15, yPosition, size, size+10)
                self.view.addSubview(fish)
                
                // define the animation
                UIView.animateWithDuration(7, delay: delay, options: [.CurveEaseIn, .Repeat], animations: {
                    
                    // move the fish
                    fish.frame = CGRectMake(screenWidth/2, yPosition, size, size+10)
                    
                    }, completion: { animationFinished in
                        
                        // remove the fish
                        sleep(5)
                        
                        //                        fish.removeFromSuperview()
                })
                let viewsToAnimate = [fish]
                UIView.performSystemAnimation(UISystemAnimation.Delete, onViews: viewsToAnimate, options: .CurveEaseIn, animations: {}, completion: { finished in
                    // any code entered here will be applied
                    // once the animation has completed
                    
                })
            }
        }
    }
    
    @IBAction func buttonClicked(sender: AnyObject){
        shark_number = 3
        Draw(shark_number, image: "shark.png", inverted: "shark-inverted.png", size_fish: 130, stop: 1)
    }
    
    
}
