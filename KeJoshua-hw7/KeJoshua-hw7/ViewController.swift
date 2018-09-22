//
//  ViewController.swift
//  KeJoshua-hw7
//
//  Created by Ke, Joshua C on 10/23/17.
//  Copyright © 2017 Ke, Joshua C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var distance = 50
    var direction = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gesturing"
        // Do any additional setup after loading the view, typically from a nib.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleRightSwipe))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleLeftSwipe))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let rightEdge = self.view.frame.size.width
        let leftEdge = 0
        let width = label.frame.width
        let height = label.frame.height
        let y = label.frame.origin.y
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            let currentLocation = self.label.frame.origin.x
            let newLocation = currentLocation + (CGFloat(self.direction) * CGFloat(self.distance))
            self.label.frame = CGRect(x: newLocation, y: y, width: width, height: height)
            if (self.label.frame.minX < CGFloat(leftEdge)) {
                self.label.frame = CGRect(x: 0, y: y, width: width, height: height)
                self.direction = 1
            }
            if (self.label.frame.maxX > CGFloat(rightEdge)) {
                self.label.frame = CGRect(x: rightEdge - width, y: y, width: width, height: height)
                self.direction = -1
            }
        }, completion: nil)
        
    }
    
    func handleRightSwipe () {
        let rightEdge = self.view.frame.size.width
        let width = label.frame.width
        let height = label.frame.height
        let y = label.frame.origin.y
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            let newLocation = rightEdge + width
            self.label.frame = CGRect(x: newLocation, y: y, width: width, height: height)
        }, completion: nil)
    }
    
    func handleLeftSwipe () {
        let leftEdge = 0
        let width = label.frame.width
        let height = label.frame.height
        let y = label.frame.origin.y
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            let newLocation = CGFloat(leftEdge) - width
            self.label.frame = CGRect(x: newLocation, y: y, width: width, height: height)
        }, completion: nil)
    }
    
}


