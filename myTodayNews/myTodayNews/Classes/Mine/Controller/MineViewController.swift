//
//  MineViewController.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/8.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
    
    // 存储我的关注数据
    var concerns = [MyConcern]()
    // 存储 cell的数据
    var sectionArrays = [[MyCellModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = UIColor.myBackgroudColor()
        tableView.separatorStyle = .none
        tableView.yz_registerCell(cell: myOtherCell.self)
        tableView.yz_registerCell(cell: MyFirstSectionCell.self)
//        tableView.register(UINib(nibName: String(describing: myOtherCell.self), bundle: nil), forCellReuseIdentifier:String(describing: myOtherCell.self))
        NetworkTool.loadMyCellData { (sections) in
            // 返回数据没有 "我的关注" 先加上去
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myConcerns = [MyCellModel]()
            myConcerns.append(myConcern!)
            
            self.sectionArrays.append(myConcerns)
            self.sectionArrays += sections
            self.tableView.reloadData()
            
            NetworkTool.loadMyConcern(completionHandler: { (myConcerns) in
                self.concerns = myConcerns
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            })
            
        }
        
    }
    
    /// 懒加载 头部
    private lazy var headerView = NoLoginHeaderView.loadViewFromNib()

}
extension MineViewController{
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ?0 :10
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (concerns.count == 0 || concerns.count == 1) ? 40 : 114
        }
        return 44
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.yz_dequeueReusableCell(indexPath: indexPath) as MyFirstSectionCell
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyFirstSectionCell.self)) as! MyFirstSectionCell
            let section = self.sectionArrays[indexPath.section]
    
            cell.myCellModel = section[indexPath.row]
            if concerns.count == 0 || concerns.count == 1{
                cell.collectionView.isHidden = true
            }
            
            if concerns.count == 1 {
                cell.myConcern = concerns[0]
            }
            
            if concerns.count > 1{
                cell.myConcerns = concerns
            }
            
            return cell
        }
        let cell = tableView.yz_dequeueReusableCell(indexPath: indexPath) as myOtherCell
        let section = self.sectionArrays[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            let totalOffset = kMyHeaderViewHeight + abs(offsetY)
            print("totalOffset =" + "\(totalOffset)")
            let f = totalOffset / kMyHeaderViewHeight
            print("1111f =" + "\(f)")
            headerView.bgImageView.frame = CGRect(x: -kScreenWidth * (f - 1) * 0.5, y: offsetY, width: kScreenWidth * f, height: totalOffset)
        }
        
    }
    
}
