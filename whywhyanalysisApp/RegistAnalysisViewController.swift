//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit
import RealmSwift

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
        // Realmデータベースを取得
        let realm = try! Realm()
        
        // テキストフィールドの情報をデータベースに追加
        try! realm.write {
            realm.add(analysis)
        }
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
