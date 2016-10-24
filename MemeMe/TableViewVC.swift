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
        if (self.tabBarController?.tabBar.isHidden)! {
           self.tabBarController?.tabBar.isHidden  = false
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let finalMeme = appDelegate.memes
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = self.storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailedViewVC
        let meme = appDelegate.memes[indexPath.row]
        
        detailView.finalImage = meme.memedImage
        detailView.topText = meme.topText
        detailView.bottomText = meme.bottomText
        detailView.originalImage = meme.image
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    var deleteMemeIndexPath: NSIndexPath? = nil
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteMemeIndexPath = indexPath as NSIndexPath?
            let memeToDelete = appDelegate.memes[indexPath.row]
            confirmDelete(meme: memeToDelete)
        }
    }
    
    func confirmDelete(meme: Meme) {
        let alert = UIAlertController(title: "Delete Meme", message: "Are you sure you want to permanently delete this Meme?", preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleDeleteMeme)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeleteMeme)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support display in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0,width:  1.0, height: 1.0)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleDeleteMeme(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteMemeIndexPath {
            tableView.beginUpdates()
            appDelegate.memes.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
    
            deleteMemeIndexPath = nil
            tableView.endUpdates()
        }
    }
    
    func cancelDeleteMeme(alertAction: UIAlertAction!) {
        deleteMemeIndexPath = nil
    }
    
}
