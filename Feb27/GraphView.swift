//
//  GraphView.swift
//  Feb27
//
//  Created by Sara Lipowsky on 3/6/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex:Int){
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)


        
    }
}


class GraphView: UIView {
    //look into this... we don't have the class, but if we did
    //then this is what we would do
    //let CalcData: DiscountCalc = DiscountCalc.shared
    
    //let CalcData: 
   
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context:CGContext = UIGraphicsGetCurrentContext()!
        //defining constant but not using it till later...
        //ignore errors
        
        //to get screen height and width
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let leftGuide:CGFloat = 16.0
        //let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 64.0 + 16.0
        
        
        //Draw Rectangle
        context.setFillColor(0x84516D)
        
        //context.setFillColor(red: 0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //x and y are coordinates of screen
        //height and width are dimensions of the rectangle
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 32.0, height:screenHeight - 96.0))
        
        
        //Draw Text
        let myText = "Cyan Box"
        let subText = "Baby Blue..."
        
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size:16.0)!,
            NSForegroundColorAttributeName: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
            ]
        //let myTextPos:CGPoint = CGPoint(x: leftGuide +16.0, y:topGuide + 16.0)
        
        myText.draw(at:CGPoint(x:leftGuide + 16.0, y:topGuide + 16.0), withAttributes: textAttributes)
        subText.draw(at:CGPoint(x:leftGuide + 16.0, y:topGuide + 32.0), withAttributes: textAttributes)
        
    }
    

}
