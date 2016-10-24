//
//  DetailedViewVC.swift
//  MemeMe
//
//  Created by Ayush Garg on 23/10/16.
//  Copyright © 2016 Headmaster Technologies. All rights reserved.
//

import UIKit

class DetailedViewVC: UIViewController {
    
    var topText: String?
    var bottomText: String?
    var finalImage:  UIImage?
    var originalImage: UIImage?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.rightBarButtonItem = editButtonItem
        editButtonItem.action = #selector(DetailedViewVC.editButtonPressed)
        
        
        if let topText = topText {
            if let bottomText = bottomText {
                label.text = topText + " " + bottomText
            }
        }
        
        if let finalImage = finalImage{
            image.image = finalImage
        }
    }
    
    func editButtonPressed() {
        let editMeme = self.storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
        print(originalImage)
        editMeme.origTopText = topText!
        editMeme.origBottomText = bottomText!
        editMeme.origImage = originalImage!
        editMeme.edit = true
        self.present(editMeme, animated: false, completion: {
            print("presented")
            
        })
    }



}
