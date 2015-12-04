//
//  ThirdViewController.swift
//  myappF1
//
//  Created by 吴昊 on 4/27/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit
import CoreData
class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    //kongjian
    var incomeCategory = ["银行账户","债务出入","现金","其他收入","吃饭","交通","网上消费","银行账户","债务出入","现金","其他支出"]
    var icon = ["bank","debt","cash","other","food","car","web","bank","debt","cash","other"]
    var plusOrMinor = ["plus","plus","plus","plus","minor","minor","minor","minor","minor","minor","minor"]
    var fakeAmount = [60,33,45,16,25,99,100,100,40,34,56]

    @IBOutlet var tableViewTj: UITableView!
    @IBOutlet var weekButton: UIButton!
    @IBOutlet var historyButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    
    var formatter:NSDateFormatter = NSDateFormatter()
    //coredata
    
    
    var fetchedResultsController: NSFetchedResultsController?
    var managedObjectContext: NSManagedObjectContext?
    var error: NSError? = nil
    
    
    
    
    
    
    
    
    
    
    
    
    
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewTj.delegate = self
        tableViewTj.dataSource = self
        
        
        setupButton(weekButton)
        setupButton(historyButton)
        setupButton(monthButton)
        
        if(!self.initFetchedResultsController().performFetch(&error)){
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        
        var context = appDelegate.managedObjectContext
        var billRequest = NSFetchRequest(entityName: "Bills")
        var billObjects = context?.executeFetchRequest(billRequest, error: nil) as! [NSManagedObject]
        for object in billObjects{
            formatter.dateFormat = "yyyy年MM月dd日 hh:mm:ss"
            
            
            if(object.valueForKey("amount") == nil){
                
                var a = 0
                var b = object.valueForKey("category") as! String
                var co = object.valueForKey("ctime") as! NSDate
                var c = formatter.stringFromDate(co)
                
                var d = object.valueForKey("memo") as! String
               println("金额为: \(a)")
                println("类型是: \(b)")
                println("时间是: \(c)")
                println("备注信息是: \(d)")
                
            
            }
            else{
                
                
                
            var a: Int = object.valueForKey("amount") as! Int
    
            var b = object.valueForKey("category") as! String
            var co = object.valueForKey("ctime") as! NSDate
                   var c = formatter.stringFromDate(co)
            var d = object.valueForKey("memo") as! String
                
                println("金额为: \(a)")
                println("类型是: \(b)")
                println("时间是: \(c)")
                println("备注信息是: \(d)")}
            
        }
        println("done")
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupButton(button: UIButton){
    
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderWidth = 0.4
        
       
        
        
    
    
    
    
    
    }
    func setCellInfo(cell: BillCell, indexPath: NSIndexPath) {
        var bill = self.fetchedResultsController?.objectAtIndexPath(indexPath) as! Bills
        //zhuanxing
        formatter.dateFormat = "MM月dd日 hh:mm"
        var date = formatter.stringFromDate(bill.ctime)
        
        var amount1:String = String(bill.amount.integerValue)
        var category1:String = bill.category
        
        
        
//        cell.labelA!.text = amount1
cell.labelA!.text = String(fakeAmount[indexPath.row])
        
        cell.labelC!.text = incomeCategory[indexPath.row]
        cell.labelD!.text = date
        cell.frontImg.image = UIImage(named: icon[indexPath.row])
        cell.backImg.image = UIImage(named: plusOrMinor[indexPath.row])
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let str = "cell"
        var cell1:BillCell = tableView.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) as! BillCell
        self.setCellInfo(cell1, indexPath: indexPath)
        
//        var context = appDelegate.managedObjectContext
//        var billRequest = NSFetchRequest(entityName: "Bills")
//        var sortDescrpitor = NSSortDescriptor(key: "ctime", ascending: true,selector: Selector("localizedStandardCompare:"))
//        billRequest.sortDescriptors = [sortDescrpitor]
//        var billObjects = context?.executeFetchRequest(billRequest, error: nil) as! [NSManagedObject]
        
        
        return cell1
        
        
        
    }
    
    func initFetchedResultsController() ->NSFetchedResultsController
    {
        NSLog("===initFetchedResultsController===")
        if self.fetchedResultsController != nil {
            return self.fetchedResultsController!
        }
        // 创建一个获取数据的实例，用来查询实体
        
        var fetchRequest = NSFetchRequest()
        managedObjectContext = appDelegate.managedObjectContext
        
        var entity = NSEntityDescription.entityForName("Bills", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        
        // 创建排序规则
        
        
        var sortDescrpitor = NSSortDescriptor(key: "ctime", ascending: true,selector: Selector("localizedStandardCompare:"))
        
        fetchRequest.sortDescriptors = [sortDescrpitor]
        
        
        // 创建获取数据的控制器，将section的name设置为author，可以直接用于tableViewSourceData
        
        var fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: "category", cacheName: "Root")
        
    
        
        fetchedResultsController.delegate = self
        
        self.fetchedResultsController = fetchedResultsController
        
        return fetchedResultsController

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var context = appDelegate.managedObjectContext
        var billRequest = NSFetchRequest(entityName: "Bills")
        var billObjects = context?.executeFetchRequest(billRequest, error: nil) as! [NSManagedObject]
//        return billObjects.count
        return 11
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
