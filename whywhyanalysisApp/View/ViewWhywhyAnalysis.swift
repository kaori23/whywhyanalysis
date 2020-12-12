//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class ViewWhywhyAnalysis: UIView {
    
    @IBOutlet weak var problemTextField: UITextField!
    
    @IBOutlet weak var oneWhyTextFiled: UITextField!
    
    @IBOutlet weak var twoWhyTextField: UITextField!
    
    @IBOutlet weak var threeWhyTextField: UITextField!
    
    @IBOutlet weak var fourWhyTextField: UITextField!
    
    @IBOutlet weak var fiveWhyTextField: UITextField!
    
    @IBOutlet weak var measuresTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var whywhyAnalysis: WhywhyAnalysis!
    
    var mode = ""

}
