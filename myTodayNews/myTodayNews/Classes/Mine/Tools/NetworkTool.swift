//
//  NetworkTool.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/9.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
//---------------------------------我的 mine --------------------------------------------
     // MARK: 我的界面 cell 的数据
    static func loadMyCellData(completionHandler: @escaping(_ sections: [[MyCellModel]]) -> ())
    // MARK: 我的关注数据
    static func loadMyConcern(completionHandler: @escaping (_ concerns: [MyConcern]) -> ())
    
}

extension NetworkToolProtocol{
//---------------------------------我的 mine --------------------------------------------
    
    /// 我的界面 cell 的数据
    /// - parameter completionHandler: 返回我的 cell 的数据
    /// - parameter sections: 我的界面 cell 的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ()){
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
             guard response.result.isSuccess else {
                //请求错误
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                guard  json["message"] == "success" else{
                    return
                }
                
                if let data = json["data"].dictionary{
                    print(data)
                    if let sections = data["sections"]?.array{
                        var sectionArrays = [[MyCellModel]]()
                        for item in sections{
                            var rows = [MyCellModel]()
                            for row in item.arrayObject! {
                                let myCellModel = MyCellModel.deserialize(from: row as! NSDictionary)
                                rows.append(myCellModel!)
                            }
                            sectionArrays.append(rows)
                        }
                        completionHandler(sectionArrays)
                    }
                }
            }
            
            
        }
        
        
    }
    
    /// 我的关注数据
    /// - parameter completionHandler: 返回我的关注数据
    /// - parameter concerns: 我的界面我的关注数组
    static func loadMyConcern(completionHandler: @escaping (_ concerns: [MyConcern]) -> ()) {
        
        let url = BASE_URL + "/concern/v2/follow/my_follow/?"
        let params = ["device_id": device_id]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else { return }
                if let datas = json["data"].arrayObject {
                    completionHandler(datas.compactMap({ MyConcern.deserialize(from: $0 as? Dictionary) }))
                }
            }
        }
    }
}

struct NetworkTool: NetworkToolProtocol{
 
}


