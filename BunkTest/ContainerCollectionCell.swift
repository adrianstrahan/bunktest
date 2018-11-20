//
//  ContainerCollectionCell.swift
//  BunkTest
//
//  Created by Adrian Strahan on 20/11/2018.
//  Copyright © 2018 UseGIS Limited. All rights reserved.
//

import UIKit

class ContainerCollectionCell: UICollectionViewCell {

  var label: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    customInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    customInit()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    label.preferredMaxLayoutWidth = label.frame.size.width
    super.layoutSubviews()
  }

  func customInit() {
    self.backgroundColor = .yellow
    label = UILabel(frame: contentView.frame)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .left
    //label.font = UIFont(name: (label.font?.fontName)!, size: 12)
    contentView.addSubview(label)

    label.translatesAutoresizingMaskIntoConstraints = false
    let top = label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
    top.priority = UILayoutPriority(999)
    let leading = label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
    let trailing = label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
    NSLayoutConstraint.activate([top, leading, trailing])

    self.contentView.backgroundColor = .white
  }
}
