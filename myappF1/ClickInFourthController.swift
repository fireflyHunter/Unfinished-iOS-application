//
//  ClickInFourthController.swift
//  myappF1
//
//  Created by 吴昊 on 5/8/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit

class ClickInFourthController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func goBack(){
    self.dismissViewControllerAnimated(true, completion: nil
        )
    
    }
    
    
    
    @IBAction func ClickToReturn(sender: UIButton) {
      goBack()
    }
  
    
    @IBAction func ClickToReturn2(sender: UIButton) {
        goBack()
    }
    @IBAction func ClickToReturn1(sender: UIButton) {
     goBack()    }
    
    @IBAction func ClickToReturn3(sender: UIButton) {
        goBack()
    }
    @IBAction func ClickToReturn4(sender: UIButton) {
        goBack()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}