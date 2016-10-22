//
//  DetailedViewVC.swift
//  MemeMe
//
//  Created by Ayush Garg on 23/10/16.
//  Copyright © 2016 Headmaster Technologies. All rights reserved.
//

import UIKit

class DetailedViewVC: UIViewController {
    
    var labelText: String?
    var finalImage:  UIImage?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func doneButtonClicked(){
//        let tableView = self.storyboard!.instantiateViewController(withIdentifier: "TableViewVC") as! TableViewVC
//        self.navigationController?.popToViewController(tableView, animated: true)
         self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let labelText = labelText {
            label.text = labelText
        }
        
        if let finalImage = finalImage{
            image.image = finalImage
        }
//        label.text = labelText
//        image.image = finalImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
