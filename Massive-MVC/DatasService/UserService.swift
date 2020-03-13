//
//  UserService.swift
//  Massive-MVC
//
//  Created by Ominext on 3/13/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

let ApiBaseURl = "https://api.github.com/search/users?q="


typealias UserCallback = ([UserEntity]) -> Void
typealias ErrorCallback = (NSError) -> Void
protocol UserApiClient {
  
  static func requestUserWithUsername(username: String,
                                      onSuccess: UserCallback?,
                                      onError: ErrorCallback?)
}


class UserService: UserApiClient {
  static func requestUserWithUsername(username: String, onSuccess: UserCallback?, onError: ErrorCallback?) {
    
    Alamofire.request(ApiBaseURl+"\(username)").responseJSON { (response) in
      
      switch response.result{
        
      case .success(_):
        
        do{
          
          DispatchQueue.global(qos: .background).async {
            
            let data = response.data
            let json = try? JSON(data)
            let arrayResponse = json?["items"].arrayObject
            
            let arrayObject = Mapper<UserEntity>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
            onSuccess!(arrayObject)
          }
          break
          
        }catch{
          debugPrint(error.localizedDescription)
        }
      case .failure(let err):
        onError?(err as NSError)
        break
        
        
      }
      
    }
    
  }
  
  
  
}

