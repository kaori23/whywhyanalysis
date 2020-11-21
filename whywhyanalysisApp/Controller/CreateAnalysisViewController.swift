//
//  CreateAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/14.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit


class CreateAnalysisViewController: UIViewController {
    
    
    @IBOutlet weak var problemTextField: UITextField!
    
    @IBOutlet weak var oneWayTextField: UITextField!
    
    @IBOutlet weak var twoWayTextField: UITextField!
    
    @IBOutlet weak var threeTextField: UITextField!
    
    @IBOutlet weak var fourTextFIeld: UITextField!
    
    
    @IBOutlet weak var fiveTextField: UITextField!
    
    
    @IBOutlet weak var measuresTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func confirmPopOverClick(_ sender: Any) {
        if(ValidateUtility.textEmplyCheck(optinalText: problemTextField.text) == true)
            && (ValidateUtility.textEmplyCheck(optinalText: oneWayTextField.text) == true)
            && (ValidateUtility.textEmplyCheck(optinalText: measuresTextField.text) == true) {
            let storyboard: UIStoryboard = self.storyboard!
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "resistAnalysis") as! RegistAnalysisViewController
            
            nextViewController.measures = measuresTextField.text!
            nextViewController.problem = problemTextField.text!
            nextViewController.oneWhy = oneWayTextField.text!
            nextViewController.twoWhy = twoWayTextField.text!
            nextViewController.threeWhy = threeTextField.text!
            nextViewController.fourWhy = fourTextFIeld.text!
            nextViewController.fiveWhy = fiveTextField.text!
            
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            print("空の項目あり")
        }
    }
}
