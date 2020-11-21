//
//  RegistAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/11.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit
import RealmSwift

class RegistAnalysis: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var problem = ""
    var measures = ""
    var oneWay = ""
    var twoWay = ""
    var threeWay = ""
    var fourWay = ""
    var fiveWay = ""
    
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
        // Realmデータベースを取得
        let realm = try! Realm()

        // ⑤・・・Realmインスタンスからaddを叩くと、データベースにレコードが追加される
        // テキストフィールドの情報をデータベースに追加
        try! realm.write {
          realm.add(analysis)
        }
        self.navigationController?.popToRootViewController(animated: true)
                
    }
}



