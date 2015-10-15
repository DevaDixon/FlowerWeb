//
//  ViewController.swift
//  FlowerWeb
//
//  Created by csit267-13 on 10/14/15.
//  Copyright (c) 2015 CSIT_267. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    
    @IBAction func getFlower(sender: AnyObject?) {
        var imageURL: NSURL
        var detailURL: NSURL
        var imageURLString: String
        var detailURLString: String
        var color: String
        let sessionID: Int=random()%50000
        
        color = colorChoice.titleForSegmentAtIndex(colorChoice.selectedSegmentIndex)!
        
        imageURLString = "https://www.floraphotographs.com/showrandomios.php?color=\(color)&session=\(sessionID)"
        
        detailURLString = "https://www.floraphotographs.com/detailios.php?session=\(sessionID)"
        
        imageURL = NSURL(string: imageURLString)!
        detailURL = NSURL(string: detailURLString)!
        
        flowerView.loadRequest(NSURLRequest(URL: imageURL))
        flowerDetailView.loadRequest(NSURLRequest(URL: detailURL))
    }
    
    @IBAction func toggleFlowerDetail(sender: AnyObject) {
        flowerDetailView.hidden = !(sender as! UISwitch).on
        blurView.hidden = !(sender as! UISwitch).on
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flowerDetailView.hidden=true
        getFlower(nil)
        blurView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

