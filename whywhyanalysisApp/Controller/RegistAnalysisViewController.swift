//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class RegistAnalysisViewController: UIViewController {
    
    var problem = ""
    var measures = ""
    var oneWhy = ""
    var twoWhy = ""
    var threeWhy = ""
    var fourWhy = ""
    var fiveWhy = ""
    
    @IBOutlet weak var problemLabel: UILabel!
    
    @IBOutlet weak var measuresLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        problemLabel.text = problem
        measuresLabel.text = measures
        isModalInPresentation = true
        
    }
    
    
    @IBAction func registAnalysis(_ sender: Any) {
        let analysis: Whywhyanalysis = Whywhyanalysis()
        if(problem != "") {
            analysis.problem = problemLabel.text!
        }
        
        if(measures != "") {
            analysis.measures = measuresLabel.text!
        }
        
        if(oneWhy != "") {
            analysis.oneWhy = oneWhy
        }
        
        if(twoWhy != "") {
            analysis.twoWhy = twoWhy
        }
        
        if(threeWhy != "") {
            analysis.threeWhy = threeWhy
        }
        
        if(fourWhy != "") {
            analysis.fourWhy = fourWhy
        }
        
        if(fiveWhy != "") {
            analysis.fiveWhy = fiveWhy
        }
        let data = DataStorage()
        data.createData(analysis)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
