//
//  ViewController.swift
//  DragToSortLikeAlipay
//
//  Created by 刘隆昌 on 16/11/26.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView! = nil
    var dataArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initData()
        self.makeUI()
    }
    
    func edit(){
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
    }
    
    func initData(){
        for idx in 0..<100 {
            dataArray.add("\(idx)")
        }
    }
    
    func makeUI(){
        
        self.view.backgroundColor = UIColor.white
        self.title = "拖动cell排序"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(ViewController.edit))
        
        let tabView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        view.addSubview(tabView)
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: "IDD")
        tabView.delegate = self
        tabView.dataSource = self
        self.tableView = tabView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDD", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataArray.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
    }
    //MARK  拖动排序 此方法只对 group类型有效
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

