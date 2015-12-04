//
//  FourthController.swift
//  myappF1
//
//  Created by 吴昊 on 5/8/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var arr = ["密码保护","帮助","关于软件","飞起来去体检","我疯狂洗海带"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let str = "cell"
        var cell:BillCell = tableView.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) as! BillCell
        
        
       
        cell.textLabel?.text = arr[indexPath.row]
        
        
    return cell
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    var index = indexPath.row
    let myStoryBoard = self.storyboard
        
        switch index
        {
            
            
            
        case 0:
            var view0 = myStoryBoard?.instantiateViewControllerWithIdentifier("view0") as! UIViewController
            self.showViewController(view0, sender: self)
            
        case 1:
            var view0 = myStoryBoard?.instantiateViewControllerWithIdentifier("view1") as! UIViewController
            self.showViewController(view0, sender: self)
        case 2:
            var view0 = myStoryBoard?.instantiateViewControllerWithIdentifier("view2") as! UIViewController
            self.showViewController(view0, sender: self)
        case 3:
            var view0 = myStoryBoard?.instantiateViewControllerWithIdentifier("view3") as! UIViewController
            self.showViewController(view0, sender: self)
        case 4:
            var view0 = myStoryBoard?.instantiateViewControllerWithIdentifier("view4") as! UIViewController
            self.showViewController(view0, sender: self)
            
            
            
        default:
            break
            
            
            
            
            
            
        
        
        
        }
        
        
        
        
        }
            
        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}