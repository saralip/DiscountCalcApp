//
//  CalculatorViewController.swift
//  Feb27
//
//  Created by Sara Lipowsky on 2/27/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Make swipe gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        // handleSwipe is a function down below..
        // #selector() selects and executes that function
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func textFieldDidEndEditing(_ textField:UITextField){
//        //myDiscountCalc.price = Float(priceTextField.text!)
//        grabValue()
//    }
//    func grabValue(){
//        myDiscoutCalc.price = Float(priceTextField.text!)!
//    }
    
    //Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer) {
        //calling the segue
        self.performSegue(withIdentifier: "showResults", sender: self)
        
    }

    // Enable unwinding other views
    
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){
        
    }
    
    
}
