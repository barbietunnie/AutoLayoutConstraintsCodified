//
//  ViewController.swift
//  AutoLayoutConstraintsCodified
//
//  Created by Babatunde Adeyemi on 9/17/16.
//  Copyright © 2016 Babatunde Adeyemi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colorView = UIView()
    var initialConstraints = [NSLayoutConstraint]()
    var newConstraints = [NSLayoutConstraint]()
    
    var defaultContraintActive = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = UIColor.orange
        
        self.view.addSubview(colorView)
        
        initDefaultConstraints()
    }
    
    func initDefaultConstraints() {
        let leadingConstraint = colorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = colorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = colorView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = colorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        
        initialConstraints.append(contentsOf: [leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
        NSLayoutConstraint.activate(initialConstraints)
        defaultContraintActive = true
    }
    
    @IBAction func changeConstraints(_ sender: AnyObject) {
        if(defaultContraintActive) {
            NSLayoutConstraint.deactivate(initialConstraints)
            
            let widthConstraint = colorView.widthAnchor.constraint(equalToConstant: 100)
            let heightConstraint = colorView.heightAnchor.constraint(equalToConstant: 100)
            
            let centerXConstraint = colorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            let centerYConstraint = colorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            newConstraints.removeAll()
            newConstraints.append(contentsOf: [widthConstraint, heightConstraint, centerXConstraint, centerYConstraint])
            NSLayoutConstraint.activate(newConstraints)
            
            defaultContraintActive = false
        } else {
            NSLayoutConstraint.deactivate(newConstraints)
            
            initDefaultConstraints()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

