//
//  UserListView.swift
//  Massive-MVC
//
//  Created by Ominext on 3/13/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit

class UserListView: UIView {
  private var tableView : UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    
    self.addSubview(tableView)
    tableView.register(UserListCell.self, forCellReuseIdentifier: "UserListCell")
  }
  
  func setSourceDelegate(_ obj:UserDataSourceDelegate)  {
    
        tableView.dataSource = obj
        tableView.delegate = obj
        tableView.reloadData()
    }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
