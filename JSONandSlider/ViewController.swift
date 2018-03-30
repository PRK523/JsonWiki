//
//  ViewController.swift
//  JSONandSlider
//
//  Created by Pranoti Kulkarni on 2/20/18.
//  Copyright © 2018 Pranoti Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        //Set/write userDefaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(redSlider.value, forKey: "red")
        userDefaults.set(greenSlider.value, forKey: "green")
        userDefaults.set(blueSlider.value, forKey: "blue")
        
        self.view.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        
        userDefaults.synchronize()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaults = UserDefaults.standard
        //sliders are triggering the same function so can use green or blue in the if condition
        //read from user defaults
        if (userDefaults.object(forKey: "red") != nil){
            let red = userDefaults.float(forKey: "red")
            let green = userDefaults.float(forKey: "green")
            let blue = userDefaults.float(forKey: "blue")
            
            redSlider.value = red
            blueSlider.value = blue
            greenSlider.value = green
            
            self.view.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

