//
//  CalculatorViewController.swift
//  Feb27
//
//  Created by Sara Lipowsky on 2/27/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//
//Watched https://www.youtube.com/watch?v=RuzHai2RVZU by Mark Moeykens to implement done button on keyboard

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    //connecting all the TextFields so we can access the entered userInput
    
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var disOffTextField: UITextField!
    @IBOutlet weak var addDisOffTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    
    @IBOutlet weak var swipeDirectionsLabel: UILabel!

    @IBOutlet weak var origPriceLabel: UILabel!
    @IBOutlet weak var finalDisPriceLabel: UILabel!
    
    
    
    let userInput = DiscountCalc.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        self.view.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 156/255, alpha: 1.0)

        self.view.backgroundColor = UIColor(red:234/255, green: 156/255 , blue: 198/255, alpha:1.0)
        //Adding the done button to dismiss the keyboard once the values have been entered
        //reference in comments above
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)

        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        priceTextField.inputAccessoryView = toolBar
        dollarsOffTextField.inputAccessoryView = toolBar
        disOffTextField.inputAccessoryView = toolBar
        addDisOffTextField.inputAccessoryView = toolBar
        taxTextField.inputAccessoryView = toolBar
        
        // Do any additional setup after loading the view.
        //Make swipe gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        view.addGestureRecognizer(swipeLeft)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func textFieldDidEndEditing(_ textField:UITextField){
//        //myDiscountCalc.price = Double(priceTextField.text!)
//        grabValue()
//    }
//    func grabValue(){
//        myDiscoutCalc.price = Double(priceTextField.text!)!
//    }
    
    //Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer) {
        checkInput()
        getUserInput()
        userInput.calculate()
        displayuserInput()

        //calling the segue
        self.performSegue(withIdentifier: "showResults", sender: self)
        
    }

    // Enable unwinding other views
    
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        //calling the segue
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
   
    private func checkInput(){
        
        //if the fields havent been filled out, set them to zero
        
        if (priceTextField.text == "") || (dollarsOffTextField.text == "") || (disOffTextField.text == "") || (addDisOffTextField.text == "") || (taxTextField.text == ""){
            
            //sender.isEnabled = false
            
            priceTextField.text = "0.0"
            dollarsOffTextField.text = "0.0"
            disOffTextField.text = "0.0"
            addDisOffTextField.text = "0.0"
            taxTextField.text = "0.0"
            
            userInput.savePercent = Double(0.0)
            userInput.payPercent = Double(0.0)
            
            //return false
            
        }

       // return true
        
    }

    private func getUserInput(){
        
        //Get values from the text boxes
        userInput.price = Double(priceTextField.text!)!
        userInput.dollarOff = Double(dollarsOffTextField.text!)!
        userInput.firstDiscount = Double(disOffTextField.text!)!
        userInput.secondDiscount = Double(addDisOffTextField.text!)!
        userInput.tax = Double(taxTextField.text!)!
    }
    func roundDown(_ value: Double, toNearest: Double) -> Double {
        return floor(value / toNearest) * toNearest
    }
    private func displayuserInput(){
        
        //Fill the labels with the before and after prices
        //roundDown(_:toNearest:)
//        let beforePrice = Double(userInput.pricePlusTax)
//        let afterPrice = Double(userInput.discountPrice)
//        origPriceLabel.text = "Original Price $\((roundDown(beforePrice, toNearest: 0.01)))"
//        finalDisPriceLabel.text = "Discount Price $\((roundDown(afterPrice, toNearest: 0.01)))"
        
        //let beforePrice = Double(userInput.pricePlusTax)
        userInput.roundedOprice = roundDown(userInput.pricePlusTax, toNearest: 0.01)
        userInput.roundedDprice = roundDown(userInput.discountPrice, toNearest: 0.01)
        
        origPriceLabel.text = "Original Price $ \(String(format: "%.2f", userInput.roundedOprice))"
        finalDisPriceLabel.text = "Discount Price $ \(String(format: "%.2f", userInput.roundedDprice))"

        
    }
    func doneClicked(){
        view.endEditing(true)
    }
    

}
