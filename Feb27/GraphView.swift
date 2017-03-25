//
//  GraphView.swift
//  Feb27
//
//  Created by Sara Lipowsky on 3/6/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//Color scheme is #15 retrieved from https://designschool.canva.com/blog/100-color-combinations/
//Lavender: 0x9A9EAB rgb(154,158,171)
//Branch: 0x5D535E rgb(93,83,94) //original price
//Berry: 0xEC96A4  rgb(236,150,164) //discount price
//Yellow Feathers: 0xDFE166  rgb(223,225,102) //save percent
//For future: Implement a font color extension
//For now I used this awesome hex to rgb converter https://www.webpagefx.com/web-design/hex-to-rgb/
//F98866
import UIKit

extension CGContext {
    func setFillColor(_ hex:Int){
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
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
        
        //to get screen height and width
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let leftMargin:CGFloat = 16.0
        let rightMargin:CGFloat = screenWidth - 16.0
        
        let topMargin:CGFloat = 80.0
        
        let totalRecHeight = screenHeight - 180.0
        let midPoint = (screenWidth)/2


        
        
        //Draw Rectangle
        //context.setFillColor(0x84516D)
        //context.setFillColor(red: 0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //x and y are coordinates of screen
        //height and width are dimensions of the rectangle
        //context.setFillColor(0xFFFFFF)
        //context.setFillColor(0xC8E9A0)

        //context.fill(CGRect(x:leftMargin, y:topMargin, width:screenWidth - 32.0, height:screenHeight - 96.0))
        
        //ff42oe
        //Draw Text
        //let myText = "Cyan Box"
        //let subText = "Baby Blue..."
        
        let whiteText = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size:16.0)!,
            NSForegroundColorAttributeName: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
            ]
        
        let blackText = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size:16.0)!,
            NSForegroundColorAttributeName: UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0)
        ]
        let hotPinkTextColor = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!, NSForegroundColorAttributeName: UIColor(red: 251/255, green: 90/255 , blue: 142/255, alpha:1.0)
        ]
        let lightpinkTextColor = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!, NSForegroundColorAttributeName: UIColor(red:234/255, green: 156/255 , blue: 198/255, alpha:1.0)
        ]
        let oliveTextColor = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!, NSForegroundColorAttributeName: UIColor(red:199/255, green: 187/255 , blue: 48/255, alpha:1.0)
        ]
        
        //let myTextPos:CGPoint = CGPoint(x: leftGuide + 16.0, y:topGuide + 16.0)
        
        //myText.draw(at:CGPoint(x:leftGuide + 16.0, y:topGuide + 16.0), withAttributes: textAttributes)
        //subText.draw(at:CGPoint(x:leftGuide + 16.0, y:topGuide + 32.0), withAttributes: textAttributes)
        
        
        
        let data = DiscountCalc.shared

        /*===============================================================================================
         Draw background rectangle
         ==============================================================================================*/
//        HTML code:	#FE976A
//        RGB code:	R: 254 G: 151 B: 106
        
//        HTML code:	#F5AD7C
//        RGB code:	R: 245 G: 173 B: 124
        //context.setFillColor(0xF5AD7C)
        //context.fill(CGRect(x:leftMargin, y:topMargin, width:screenWidth - 32.0, height:screenHeight - 96.0 ))
        
        /*===============================================================================================
         Draw price rectangle on left half
         ==============================================================================================*/
        //price block color F98866
        //context.setFillColor(0xFF420E)
        //HTML code:	#FB5A8E
        //RGB code:	R: 251 G: 90 B: 142
        
        context.setFillColor(0xEA9CC6)
        context.fill(CGRect(x:leftMargin, y:topMargin, width:(screenWidth)/2 - 16, height:totalRecHeight))
        
        /*===============================================================================================
         Draw save rectangle on right column
         ==============================================================================================*/
        //old: 0x5DC896
        //yellow: 0xDFE166
        //89DA59
//        HTML code:	#C7BB30
//        RGB code:	R: 199 G: 187 B: 48
        context.setFillColor(0xC7BB30)
        let savePercentHeight = (data.savePercent/100)*Double(totalRecHeight)
        context.fill(CGRect(x: midPoint, y: 64.0 + leftMargin, width: midPoint - leftMargin, height: CGFloat(savePercentHeight)))

        /*===============================================================================================
         Draw pay rectangle on right column
         ==============================================================================================*/
        //old: 0xE6643B
        //berry: 0xEC96A4
        let payPercentHeight = Double(totalRecHeight) - savePercentHeight
        //context.setFillColor(0xEC96A4)
//        HTML code:	#EA9CC6
//        RGB code:	R: 234 G: 156 B: 198
        context.setFillColor(0xF15398)
        context.fill(CGRect(x: midPoint, y: CGFloat(savePercentHeight) + 80.0, width: midPoint - leftMargin, height: CGFloat(payPercentHeight)))
        
        
        //===========================================Price Text===================================================
        let priceText = "Original Price"
        let priceTextCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*6)
        priceText.draw(at: priceTextCoord, withAttributes: lightpinkTextColor)

        let priceAmount = "$\(String(format: "%.2f", data.pricePlusTax))"
        let priceAmountCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*7)
        priceAmount.draw(at: priceAmountCoord, withAttributes: lightpinkTextColor)
        //===========================================Pay Text======================================================
        let payText = "You Pay"
        let payTextCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*6)
        payText.draw(at: payTextCoord, withAttributes: hotPinkTextColor)

        let payAmount = "$\(String(format: "%.2f", data.pricePlusTax - data.saveAmount))"
        let payAmountCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*7)
        payAmount.draw(at: payAmountCoord, withAttributes: hotPinkTextColor)

        let payPercent = "\(String(format: "%.2f", data.payPercent))%"
        let payPercentCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*8)
        payPercent.draw(at: payPercentCoord, withAttributes: hotPinkTextColor)
        //===========================================Save Text======================================================
        let saveText = "You Saved"
        let saveTextCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*6)
        saveText.draw(at: saveTextCoord, withAttributes: oliveTextColor)

        let saveAmount = "$\(String(format: "%.2f", data.saveAmount))"
        let saveAmountCoord = CGPoint(x: midPoint - 32 , y: totalRecHeight + leftMargin*7)
        saveAmount.draw(at: saveAmountCoord, withAttributes: oliveTextColor)

        let savePercent = "\(String(format: "%.2f", data.savePercent))%"
        let savePercentCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*8)
        savePercent.draw(at: savePercentCoord, withAttributes: oliveTextColor)
        //=========================================================================================================
        
    }
    

}
