//
//  RatingControl.swift
//  spa
//
//  Created by Sendhil kumar Gurunathan on 10/31/15.
//  Copyright © 2015 Sendhil kumar Gurunathan. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    
    var stars = 5
    
    var ratingButtons = [ UIButton]()
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarmage = UIImage(named: "filledStar")
        
        for _ in 0..<stars {
    
            
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setImage(emptyStarImage, forState: .Normal)
        button.setImage(filledStarmage, forState: .Selected)
        button.setImage(filledStarmage, forState: [.Highlighted , .Selected ])
            button.adjustsImageWhenHighlighted = false;
            
        //button.backgroundColor = UIColor.blueColor()
        button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
        addSubview(button)
            
        ratingButtons.append(button)

        //ratingButtons += [button]
        }
        
        //CreateStars()
    }
    
    func CreateStars(){
        
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarmage = UIImage(named: "filledStar")
        //ratingButtons.removeAll()
        for _ in 0..<stars {
            
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarmage, forState: .Selected)
            button.setImage(filledStarmage, forState: [.Highlighted , .Selected ])
            button.adjustsImageWhenHighlighted = false;
            
            //button.backgroundColor = UIColor.blueColor()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
            
            ratingButtons.append(button)
            
            //ratingButtons += [button]
        }

        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 250, height: 44)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
        
    }
    // MARK: Button Action
    
    func ratingButtonTapped(button:UIButton){
        print ("(ratingButtons.indexOf(button)!)");
        rating = ratingButtons.indexOf(button)! + 1;
       // updateButtonSelectionStates();

        
        //print("button tapped")
        /*
        let alert = UIAlertController(title: "Hello!", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
       // presentViewController(alert, animated: true) { () -> Void in }
        
        */
        
        
    }
    
    func updateButtonSelectionStates(){
        for (index,button1) in ratingButtons.enumerate(){
            button1.selected = index < rating;
        }
    }
    
}
