//
//  ResultsViewController.swift
//  Feb27
//
//  Created by Sara Lipowsky on 2/27/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add swipe right gesture to go back to calculate
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe))
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        view.addGestureRecognizer(swipeRight)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(_ sender:UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
        
    }
    

   

}
