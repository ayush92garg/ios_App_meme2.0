//
//  GridViewVC.swift
//  MemeMe
//
//  Created by Ayush Garg on 20/10/16.
//  Copyright © 2016 Headmaster Technologies. All rights reserved.
//

import Foundation
import UIKit

class GridViewVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var gridView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        if (self.tabBarController?.tabBar.isHidden)! {
            self.tabBarController?.tabBar.isHidden  = false
        }
        gridView.delegate = self
        gridView.dataSource = self
        gridView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath)
        let meme = appDelegate.memes[indexPath.row]
        let imageView = UIImageView(image: meme.memedImage)
        cell.backgroundView = imageView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = self.storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailedViewVC
        let meme = appDelegate.memes[indexPath.row]
        detailView.finalImage = meme.memedImage
        detailView.topText = meme.topText
        detailView.bottomText = meme.bottomText
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
