//
//  UIKit+Extension.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/12.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit



protocol RegistCellFromNib {}

extension RegistCellFromNib{
  static  var identifer: String {
        return "\(self)"
    }
    
    static var nib: UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}

extension UITableView{
    /// 注册 cell 的方法
    func yz_registerCell<T: UITableViewCell>(cell: T.Type) where T: RegistCellFromNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifer)
        }else{
            register(cell, forCellReuseIdentifier: T.identifer)
        }
    }
    
    /// 从缓存池中出队已经存在的 cell
    func yz_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegistCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifer, for: indexPath) as! T
    }

}

extension UICollectionView{
    /// 注册 cell 的方法
    func yz_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: RegistCellFromNib {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifer)
        }else{
            
            register(cell, forCellWithReuseIdentifier: T.identifer)
        }
    }
    
    /// 从缓存池中出队已经存在的 cell
    func yz_deq<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: RegistCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifer, for: indexPath) as! T
    }
    
}
