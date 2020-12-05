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
    
    @IBOutlet weak var threeTextField: UITextField!
    
    @IBOutlet weak var fourTextField: UITextField!
    
    @IBOutlet weak var fiveTextField: UITextField!
    
    @IBOutlet weak var measuresTextField: UITextField!
    
    var whywhyAnalysis: WhywhyAnalysis!
    
    
    override func loadView() {
        view = R.nib.whyWhyAnalysisView(owner: self)
        
        // 各テキストの初期化
        problemTextField.text = whywhyAnalysis.problem
        oneWhyTextFiled.text = whywhyAnalysis.oneWhy
        twoWhyTextField.text = whywhyAnalysis.twoWhy
        threeTextField.text = whywhyAnalysis.threeWhy
        fourTextField.text = whywhyAnalysis.fourWhy
        fiveTextField.text = whywhyAnalysis.fiveWhy
        measuresTextField.text = whywhyAnalysis.measures
    }

    
    override func viewDidLoad() {
           super.viewDidLoad()
       }

}
