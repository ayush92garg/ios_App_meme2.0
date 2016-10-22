//
//  ViewController.swift
//  MemeMe
//
//  Created by Ayush Garg on 19/10/16.
//  Copyright © 2016 Headmaster Technologies. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
            let meme = appDelegate.memes[indexPath.row]
            
            // Set the name and image
            cell.textLabel?.text = meme.topText + " " + meme.bottomText
            cell.imageView?.image = meme.memedImage
            
            return cell
    }
}
