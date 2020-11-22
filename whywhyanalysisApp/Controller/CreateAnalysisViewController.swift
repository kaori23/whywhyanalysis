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
    
    @IBOutlet weak var oneWhyTextField: UITextField!
    
    @IBOutlet weak var twoWhyTextField: UITextField!
    
    @IBOutlet weak var threeWhyTextField: UITextField!
    
    @IBOutlet weak var fourWhyTextFIeld: UITextField!
    
    
    @IBOutlet weak var fiveWhyTextField: UITextField!
    
    
    @IBOutlet weak var measuresTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func confirmPopOverClick(_ sender: Any) {
        if(ValidateUtility.textEmplyCheck(optinalText: problemTextField.text))
            && (ValidateUtility.textEmplyCheck(optinalText: oneWhyTextField.text))
            && (ValidateUtility.textEmplyCheck(optinalText: measuresTextField.text)) {
            let storyboard: UIStoryboard = self.storyboard!
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "resistAnalysis") as! RegistAnalysisViewController
            // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
            var twoWhy = ""
            var threeWhy = ""
            var fourWhy = ""
            var fiveWhy = ""

            if(ValidateUtility.textEmplyCheck(optinalText:twoWhyTextField.text)) {
                twoWhy = twoWhyTextField.text!
            }
            if(ValidateUtility.textEmplyCheck(optinalText: threeWhyTextField.text)) {
                threeWhy = threeWhyTextField.text!
            }
            
            if(ValidateUtility.textEmplyCheck(optinalText: fourWhyTextFIeld.text)) {
                fourWhy = fourWhyTextFIeld.text!
            }
            if(ValidateUtility.textEmplyCheck(optinalText: fiveWhyTextField.text)) {
                fiveWhy = fiveWhyTextField.text!
            }
            
            let whywhyAnalysis = WhywhyAnalysis(problem: problemTextField.text!, measures: measuresTextField.text!, oneWhy: oneWhyTextField.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy)

            nextViewController.whywhyAnalysis = whywhyAnalysis
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            print("空の項目あり")
        }
    }
}
