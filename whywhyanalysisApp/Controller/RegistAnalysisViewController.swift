//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class RegistAnalysisViewController: UIViewController {
    
    @IBOutlet weak var problemLabel: UILabel!
    
    @IBOutlet weak var measuresLabel: UILabel!

    var whywhyAnalysis: WhywhyAnalysis!
    
    var mode = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print(mode)
//        problemLabel.text = whywhyAnalysis.problem!
//        measuresLabel.text = whywhyAnalysis.measures!
    }
    
    override func loadView() {
        
    }
    
    // 何故何故分析を登録
    @IBAction func registAnalysis(_ sender: Any) {       
        let data = DataStorage()
        data.createWhyAnalyticsData(whywhyAnalysis)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
