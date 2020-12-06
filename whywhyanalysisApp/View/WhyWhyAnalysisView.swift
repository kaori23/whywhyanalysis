//
//  WhyWhyAnalysisView.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/02.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class WhyWhyAnalysisView: UIViewController {
    
    @IBOutlet weak var problemTextField: UITextField!
    
    @IBOutlet weak var oneWhyTextFiled: UITextField!
    
    @IBOutlet weak var twoWhyTextField: UITextField!
    
    @IBOutlet weak var threeWhyTextField: UITextField!
    
    @IBOutlet weak var fourWhyTextField: UITextField!
    
    @IBOutlet weak var fiveWhyTextField: UITextField!
    
    @IBOutlet weak var measuresTextField: UITextField!
    
    @IBOutlet weak var analysisBackgroundView: UIView!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    
    var whywhyAnalysis: WhywhyAnalysis!
    
    
    var mode = ""
    
    
    override func loadView() {
        view = R.nib.whyWhyAnalysisView(owner: self)
        
        if(mode == "編集"){
            // 各テキストの初期化
            problemTextField.text = whywhyAnalysis.problem
            measuresTextField.text = whywhyAnalysis.measures
            oneWhyTextFiled.text = whywhyAnalysis.oneWhy
            if(whywhyAnalysis.twoWhy != nil) {
                twoWhyTextField.text = whywhyAnalysis.twoWhy
            }
            if(whywhyAnalysis.threeWhy != nil) {
                threeWhyTextField.text = whywhyAnalysis.threeWhy
            }
            if(whywhyAnalysis.fourWhy != nil) {
                fourWhyTextField.text = whywhyAnalysis.fourWhy
            }
            if(whywhyAnalysis.fiveWhy != nil) {
                fiveWhyTextField.text = whywhyAnalysis.fiveWhy
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        analysisBackgroundView.backgroundColor = UIColor.init(red: 243/255, green: 250/255, blue: 253/255, alpha: 90/100)
    }
    
    
    @IBAction func confirmClick(_ sender: Any) {
        
        if (ValidateUtility.isTextNotEmplyCheck(optinalText: problemTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: oneWhyTextFiled.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: measuresTextField.text)) {
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
            
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: fourWhyTextField.text)) {
                fourWhy = fourWhyTextField.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: fiveWhyTextField.text)) {
                fiveWhy = fiveWhyTextField.text!
            }
            
            let whywhyAnalysis = WhywhyAnalysis(problem: problemTextField.text!, measures: measuresTextField.text!, oneWhy: oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy)
            let nextViewController = R.storyboard.main.resistAnalysis()
            nextViewController?.whywhyAnalysis = whywhyAnalysis
            if nextViewController != nil {
                print("押下")
                self.present(nextViewController!,animated: true, completion: nil)
            } else {
                print("失敗")
            }
        }
    }
}
