//
//  ContainerCollectionHeader.swift
//  BunkTest
//
//  Created by Adrian Strahan on 20/11/2018.
//  Copyright © 2018 UseGIS Limited. All rights reserved.
//

import UIKit

class ContainerCollectionHeader: UICollectionReusableView {

  var imageView: UIImageView!
  override init(frame: CGRect) {
    super.init(frame: frame)
    customInit()
  }


  //////////////////////////////////////////////////////////////////////////////
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    customInit()
  }

  func customInit() {
    clipsToBounds = true
    imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    addSubview(imageView)

    let views = ["imageView": imageView]

    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views as [String : Any]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: nil, views: views as [String : Any]))


      print("I am here")
  }
}
