//
//  UserListCell.swift
//  Massive-MVC
//
//  Created by Ominext on 3/13/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit
import AlamofireImage
class UserListCell: UITableViewCell {

  @IBOutlet var userImageView: UIImageView!
  @IBOutlet var userNameLbl: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
//      userNameLbl = UILabel()
//      userImageView = UIImageView()
        // Initialization code
    }
  
  func configureCell(userData:UserEntity)  {
    
  guard let url = URL(string: userData.avatar_url) else {
      self.imageView?.image = UIImage(named: "")
      return
    }
    
//    var request = URLRequest(url: url)
    
    do{
      let data = try? Data(contentsOf: url)
      DispatchQueue.main.async {
        self.imageView?.image = UIImage(data: data!)
//        self.userNameLbl.text = userData.login
      }
    }catch{
      debugPrint(error.localizedDescription)
    
    
    }
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//      guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,let data = data, error == nil,
//let image = UIImage(data: data)
//        else {
//          self.userImageView.image = UIImage(named: "")
//          return
//      }
//      DispatchQueue.main.async() {
//         self.userImageView.image = image
//      }
//    }.resume()//    self.userImageView.image = UIImage(data: data)
//    self.userNameLbl.text = userData.login
  }

  override func prepareForReuse() {
//    self.userImageView.af_cancelImageRequest()
//    userImageView.image = nil
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
