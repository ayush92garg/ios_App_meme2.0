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
//        cell.setText(meme.topText, bottomString: meme.bottomText)
        let imageView = UIImageView(image: meme.image)
        cell.backgroundView = imageView
        return cell
    }
    
    
}
