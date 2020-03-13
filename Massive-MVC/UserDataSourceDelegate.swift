//
//  ViewDelegate.swift
//  Massive-MVC
//
//  Created by Ominext on 3/13/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit
class UserDataSourceDelegate: NSObject {
  let userList:[UserEntity]
   init(source:[UserEntity]) {
    self.userList = source
  }

}

extension UserDataSourceDelegate:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return userList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell =  tableView.dequeueReusableCell(withIdentifier: "UserListCell") as? UserListCell else {return UserListCell()}
        let userdata =  userList[indexPath.row]

    cell.configureCell(userData: userdata)
    return cell

  }
  
  
}

extension UserDataSourceDelegate:UITableViewDelegate{
  
}

//extension ViewDelegate:UIT
