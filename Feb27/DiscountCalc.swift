//
//  DiscountCalc.swift
//  Feb27
//
//  Created by Sara Lipowsky on 3/13/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

class DiscountCalc {
    
    var price: Double
    var dollarOff: Double
    var firstDiscount: Double
    var secondDiscount: Double
    var tax: Double
    var originalPrice: Double
    var pricePlusTax: Double
    var saveAmount: Double
    var savePercent: Double
    var payPercent: Double
    var discountPrice: Double
    var roundedOprice: Double
    var roundedDprice: Double
    //Constructor
    //Remember "_" means that the caller won't be using the parameter label
    private init(_ price: Double, _ dollarOff: Double, _ firstDiscount: Double, _ secondDiscount: Double, _ tax: Double, _ originalPrice: Double, _ discountPrice: Double, _ saveAmount: Double, _ savePercent: Double, _ payPercent: Double, _ roundedOprice: Double, _ roundedDprice: Double){
        
        self.price = price
        self.dollarOff = dollarOff
        self.firstDiscount = firstDiscount
        self.secondDiscount = secondDiscount
        self.tax = tax
        self.originalPrice = originalPrice
        self.pricePlusTax = discountPrice
        self.saveAmount = saveAmount
        self.savePercent = savePercent
        self.payPercent = payPercent
        self.discountPrice = discountPrice
        self.roundedOprice = roundedOprice
        self.roundedDprice = roundedDprice
        
    }
    
    
    static let shared:DiscountCalc = DiscountCalc(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.00, 0.00)
    
    func calculate(){
        pricePlusTax = price + (price*tax)/100
        discountPrice = (1 - (firstDiscount + secondDiscount)/100)*price - dollarOff + (tax/100)*price
        saveAmount = pricePlusTax - discountPrice
        savePercent = (saveAmount/pricePlusTax)*100
        payPercent = 100 - savePercent
        
        
        //if no discount
        if discountPrice <= 0.0{
            
            discountPrice = pricePlusTax
        }
        //if they save more than the price
        if (savePercent > 100.0){
            
            savePercent = Double(100.0)
            saveAmount = pricePlusTax
        }
        
//        if payPercent < 0{
//            
//            payPercent = Double(0.0)
//            discountPrice = Double(0.0)
//            
//        }
    }
}
