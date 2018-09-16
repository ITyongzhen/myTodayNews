//
//  MyFirstSectionCell.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/11.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class MyFirstSectionCell: UITableViewCell,RegistCellFromNib {

    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myConcerns = [MyConcern](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    var myCellModel: MyCellModel? {
        didSet{
            leftLabel.text = myCellModel?.text
            rightLabel.text = myCellModel?.grey_text
        }
    }
    
    var myConcern: MyConcern?{
        didSet{
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.yz_registerCell(cell: MyConcernCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MyFirstSectionCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcerns.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.yz_dequeueReusableCell(indexPath: indexPath) as MyConcernCell
        cell.myconcern = myConcerns[indexPath.item]
        return cell
        
    }
    
}
class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = CGSize(width: 58, height: 74)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        scrollDirection = .horizontal
    }
}








