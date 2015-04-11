//
//  ViewController.swift
//  week3_hw1
//
//  Created by Appletone on 2014/8/8.
//  Copyright (c) 2014年 Appletone. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prefs = NSUserDefaults.standardUserDefaults()
//            println(prefs.floatForKey("rColor"))
//            println(prefs.floatForKey("gColor"))
//            println(prefs.floatForKey("bColor"))
            var color = UIColor(
            red: CGFloat(prefs.floatForKey("rColor")),
            green: CGFloat(prefs.floatForKey("gColor")),
            blue: CGFloat(prefs.floatForKey("bColor")),
            alpha: 1)
        
        self.view.backgroundColor = color
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func doChange(sender: AnyObject) {
        
        var color = UIColor(
               red: CGFloat(rSlider.value),
             green: CGFloat(gSlider.value),
              blue: CGFloat(bSlider.value),
             alpha: 1)
        
        self.view.backgroundColor = color
        
        
    }
    
    func captureColor() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, false, 2)
        UIGraphicsGetImageFromCurrentImageContext()
        
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @IBAction func doShare(sender: AnyObject) {
        var image = captureColor()
        var compose = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        compose.addImage(image)
        compose.setInitialText("My favorite color!")
        self.presentViewController(compose, animated: true) { () -> Void in
            //
        }
        
    }
    
    @IBAction func saveColor(sender: AnyObject) {
        var rColor = rSlider.value
        var gColor = gSlider.value
        var bColor = bSlider.value
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(rColor, forKey: "rColor")
        prefs.setValue(gColor, forKey: "gColor")
        prefs.setValue(bColor, forKey: "bColor")
        
    }
    
}

