//
//  MineViewController.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/8.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
var sectionArrays = [[MyCellModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.myBackgroudColor()
        NetworkTool.loadMyCellData { (sections) in
            // 返回数据没有 "我的关注" 先加上去
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myConcerns = [MyCellModel]()
            myConcerns.append(myConcern!)
            
            self.sectionArrays.append(myConcerns)
            self.sectionArrays += sections
            self.tableView.reloadData()
            
            
        }
        NetworkTool.loadMyConcern()
    }

}
extension MineViewController{
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10))
        view.backgroundColor = UIColor.myBackgroudColor()
        return view
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArrays.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionArrays[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let section = self.sectionArrays[indexPath.section]
        let myCellModel = section[indexPath.row]
        
        cell.textLabel?.text = myCellModel.text
        return cell
    }
    
}
