//
//  ViewController.swift
//  json
//
//  Created by Eddy Segura on 5/26/18.
//  Copyright © 2018 Eddy Segura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getDataPressed() {
        APIManager.sharedInstace.getPostWithId(postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
               self.dataView?.text = String(describing: json)
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    

    }
    
}

