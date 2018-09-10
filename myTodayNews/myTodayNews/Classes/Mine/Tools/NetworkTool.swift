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
    static func loadMyCellData(completionHandler: @escaping(_ sections: [[MyCellModel]]) -> ())
    static func loadMyConcern()
    
}

extension NetworkToolProtocol{
//---------------------------------我的 mine --------------------------------------------
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
    
    static func loadMyConcern(){
        
    }
}

struct NetworkTool: NetworkToolProtocol{
 
}


