//
//  ViewController.swift
//  Massive-MVC
//
//  Created by Ominext on 3/13/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//  private var tableView : UITableView!
  var userDelegate:UserDataSourceDelegate!
  var mainView:UserListView!
  var userApiWorker:UserApiClient!
  override func viewDidLoad() {
    super.viewDidLoad()
    UserService.requestUserWithUsername(username: "kevin", onSuccess: { (userData) in
      self.createView(user: userData)

    }) { (err) in
      debugPrint(err)
    }

  }
//

  func createView(user:[UserEntity])  {
    DispatchQueue.main.async {
      self.mainView = UserListView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
      self.view.addSubview(self.mainView)
      self.userDelegate = UserDataSourceDelegate(source: user)
      self.mainView.setSourceDelegate(self.userDelegate)
      
    }
    
  }

}

