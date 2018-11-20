//
//  TestVC.swift
//  BunkTest
//
//  Created by Adrian Strahan on 20/11/2018.
//  Copyright © 2018 UseGIS Limited. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
  var backgroundView: UIView!
  var containerCollection: UICollectionView!
  let sizingCell = ContainerCollectionCell()

  fileprivate let reuseIdentifier = "myCell"
  fileprivate let reuseIdentifierHeader = "myHeader"

  override func viewDidLoad() {
    super.viewDidLoad()

    let frame = self.view.frame
    let layout = UICollectionViewFlowLayout()
    layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/4)
    containerCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
    self.view.addSubview(containerCollection)

    containerCollection.translatesAutoresizingMaskIntoConstraints = false
    containerCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    containerCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    containerCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    containerCollection.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true

    containerCollection.register(ContainerCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    containerCollection.register(ContainerCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
    containerCollection.delegate = self
    containerCollection.dataSource = self
  }

}

extension TestVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ContainerCollectionCell
    configure(cell: cell)
    return cell
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierHeader, for: indexPath) as! ContainerCollectionHeader
      headerView.imageView.image = UIImage(named: "sunrise-1.png")
      return headerView
    default:
      assert(false, "Unexpected element kind in collection view")
    }
  }

  func configure(cell: ContainerCollectionCell) {
    cell.label.text = "This is a very long piece of text to test that it wraps over onto another line"
  }
}

