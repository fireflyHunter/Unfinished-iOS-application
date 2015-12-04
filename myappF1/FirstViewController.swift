//
//  FirstViewController.swift
//  myappF1
//
//  Created by 吴昊 on 4/27/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController,NSFetchedResultsControllerDelegate
{
    var managedObjectContext: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController?
    
var arr = ["111","212","3443","43","2","666"]
    
   


    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet var firstItem: UITabBarItem!
    @IBOutlet var clickToRecord: UIButton!//记一笔
    
    
    
    //记账弹出界面
    
    @IBOutlet var pickerView1: UIPickerView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTabBarItem()
        setupMiddleView()
        setupLabelOfDate()
//        tableView1.delegate = self
//        tableView1.dataSource = self
//        tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        var error: NSError? = nil
      
        //cell重用
        
        
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    func setupMiddleView(){
    middleView.layer.borderWidth = 0.4
        middleView.layer.borderColor = UIColor.grayColor().CGColor
        
     
    
    
    }
    func setupTabBarItem(){
        
        
        self.tabBarController?.tabBar.tintColor = UIColor(red: 81/255, green: 127/255, blue: 164/255, alpha:1)
        self.tabBarController?.tabBar.backgroundColor = UIColor(red: 26/255, green: 44/255, blue: 59/255, alpha:1)
        
     
    }
    func setupButton(){
        
        clickToRecord?.layer.cornerRadius = 5
        clickToRecord?.layer.masksToBounds = true
        clickToRecord?.layer.borderWidth = 0.4
       
        
    }
    func setupLabelOfDate(){
        var date:NSDate = NSDate()
        
        
        
        var formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        var dateString = formatter.stringFromDate(date) as String
        
        showDate.text = dateString
    
    
    
    
    }
    
    //设置cell信息
    
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let str = "cell"
//        var cell1 = tableView.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) as! UITableViewCell
//        
//        
//        return cell1
//        
//        
//    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        
//        return 1
//       
//    }


    
    
    
//  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        
//        
//        var str = "cell"
//        
//        var arr = ["我","真","是","日","了","狗","喵","狗","喵","狗","喵","狗","喵"]
//        
////        var cell:BillCell! = (tableView1.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) as BillCell
////      
//        var cell:BillCell  = tableView.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) as! BillCell
//        
//        
//        
//        
////        cell.LabelD.text = arr[indexPath.row]
//        
//        
//        return cell
//        
//        
//        
//   
//    
//     
//    }
    
    
    //tableview1滑动删除
    
    
    
    
    //获取查询控制器
  

    
    
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

