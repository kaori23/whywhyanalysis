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
        if(ValidateUtility.isTextNotEmplyCheck(optinalText: problemTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: oneWhyTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: measuresTextField.text)) {
            let nextViewController = R.storyboard.main.resistAnalysis()
            // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
            var twoWhy = ""
            var threeWhy = ""
            var fourWhy = ""
            var fiveWhy = ""

            if(ValidateUtility.isTextNotEmplyCheck(optinalText:twoWhyTextField.text)) {
                twoWhy = twoWhyTextField.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: threeWhyTextField.text)) {
                threeWhy = threeWhyTextField.text!
            }
            
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: fourWhyTextFIeld.text)) {
                fourWhy = fourWhyTextFIeld.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: fiveWhyTextField.text)) {
                fiveWhy = fiveWhyTextField.text!
            }
            
            let whywhyAnalysis = WhywhyAnalysis(problem: problemTextField.text!, measures: measuresTextField.text!, oneWhy: oneWhyTextField.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy)
            
            if nextViewController != nil {
            nextViewController!.whywhyAnalysis = whywhyAnalysis
            navigationController?.pushViewController(nextViewController!, animated: true)
            } else {
                print("画面遷移失敗")
            }
        } else {
            print("空の項目あり")
        }
    }
}
