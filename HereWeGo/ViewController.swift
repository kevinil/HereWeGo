//
//  ViewController.swift
//  HereWeGo
//
//  Created by 刘剑文 on 16/3/22.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

public struct Model {
    static var images: [UIImage] = {
        var tempImages = [UIImage]()
        for _ in 0..<9 {
            tempImages.append(UIImage(named: "bg")!)
        }
        return tempImages
    }()
    static var titles: [String] = {
        var tempTitles = [String]()
        for _ in 0..<9 {
            tempTitles.append("快帅酷")
        }
        return tempTitles
    }()
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,DrapDropCollectionViewDelegate {

    @IBOutlet weak var dragDropCollectionView: DragDropCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragDropCollectionView.draggingDelegate = self
        dragDropCollectionView.delegate = self
        dragDropCollectionView.enableDragging(true)
        setupSize()
    }
    
    override func viewWillAppear(animated: Bool) {
        dragDropCollectionView.reloadData()
    }
    
    func setupSize() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        let rectSize = (view.bounds.width - 50) / 4
        layout.itemSize = CGSizeMake(rectSize, rectSize * 4 / 3)
        dragDropCollectionView!.collectionViewLayout = layout
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as! ChooseCollectionViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.coverImageView.image = Model.images[indexPath.row]
        cell.titleLabel.text = Model.titles[indexPath.row]
        return cell
    }
    
    func dragDropCollectionViewDidMoveCellFromInitialIndexPath(initialIndexPath: NSIndexPath, toNewIndexPath newIndexPath: NSIndexPath) {
        let colorToMove = Model.images[initialIndexPath.row]
        Model.images.removeAtIndex(initialIndexPath.row)
        Model.images.insert(colorToMove, atIndex: newIndexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

}

