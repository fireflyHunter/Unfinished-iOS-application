//
//  ClickToRecordController.swift
//  myappF1
//
//  Created by 吴昊 on 5/3/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit
import CoreData



class ClickToRecordController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate {
   
    //pickbilltype的数据
    var incomeCategory = ["银行账户","债务出入","现金","其他收入"]
    //picker2的数据
    var payCategory = ["吃饭","交通","网上消费","银行账户","债务出入","现金","其他支出"]
    var selectedCategory = ""
    
    @IBOutlet var picker2: UIPickerView!

    @IBOutlet var bgView: UIView!
    @IBOutlet var pickBillType: UIPickerView!
    @IBOutlet var AmountOfBill: UITextField!
    @IBOutlet var remark: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    //创建coredata对象
    

    
    
    
    
    
    
    
    
    
    
    var TimesOFChange = 2  //设定选中次数 单双分别刷新
    
    
    
    //设置日期
    
    
    //视图加载
    override func viewDidLoad() {
        super.viewDidLoad()
        picker2.delegate = self
        pickBillType.delegate = self
        picker2.dataSource = self
        pickBillType.dataSource = self
        //隐藏picker2
        pickBillType.hidden = true
        remark.layer.borderColor = UIColor.grayColor().CGColor
        
        remark.layer.cornerRadius = 4
        
        
        remark.layer.borderWidth = 0.4
        saveButton.layer.cornerRadius = 4
        
        
        
        test()
        
        
        
        


        

        
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //pickerview设定列数

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //pickerview设定行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == picker2)
        {return payCategory.count}
        else
        {return incomeCategory.count}
        
        
    }
    //pickerview设置数据
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView == pickBillType)
        {return incomeCategory[row]}
        else{return payCategory[row]}
        
    }
    //pickerview设定高度
//    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        
//    }
    
    //选中后触发事件
    
    
    
  //选中segment来切换显示不同的pickerview
    
    @IBAction func ClickToShift(sender: AnyObject) {
        
        TimesOFChange += 1
        
        if(TimesOFChange % 2 == 0)
        {pickBillType.hidden = true
            picker2.hidden = false
        }
        else{
            pickBillType.hidden = false
            picker2.hidden = true
        }
        
        
        
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == picker2){
            selectedCategory = payCategory[row]}
        else {selectedCategory = incomeCategory[row]
        }
    }
    
    func test(){
        
        
    
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 22
    }



    @IBAction func ClickToSave(sender: UIButton) {
        var type = 0
        
        if(TimesOFChange % 2 == 0){
            type = 1}
        else {type = 0
        }
        
        //获取金额
        var amount = AmountOfBill.text.toInt()
        if (amount == nil||amount <= 0){
        var alert = UIAlertView()
            alert.title = "warning"
            alert.message = "金额不能为空"
            alert.addButtonWithTitle("OK")
            alert.show()
            return
            
            
            
        }
        
        
        //保存类型的字符串
        var category = selectedCategory
        
        //获取时间
//        var date:NSDate = NSDate()
//        var formatter:NSDateFormatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy年 MM月 dd日 HH:mm"
        var ctime = NSDate()
        
        
       
        //获取备注信息
        var memo = remark.text
        
    
        
        var appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appdelegate.managedObjectContext
        var entity = NSEntityDescription.entityForName("Bills", inManagedObjectContext: context!)
        var bill = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
    
        bill.setValue(amount, forKey: "amount")
        
        bill.setValue(type, forKey: "type")
        
        bill.setValue(category, forKey: "category")
        
        bill.setValue(ctime, forKey: "ctime")
        
        bill.setValue(memo, forKey: "memo")
        
       
        appdelegate.saveContext()
        
        //返回
        self.dismissViewControllerAnimated(true, completion: {
        }
        )
    }
    
    
        
        
        
        
    
    

    

   
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
 
    
    

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


 }
