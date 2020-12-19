//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class RegistAnalysisViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var problemLabel: UILabel!
    
    @IBOutlet weak var measuresLabel: UILabel!
    
    @IBOutlet weak var statusPickerView: UIPickerView!
    
    let statusList = ["実施中", "達成", "未達成"]
    
    var whywhyAnalysis: WhywhyAnalysis!
    
    var mode = ""
    
    var status = ""
    
    var statusNum = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statusPickerView.dataSource = self
        statusPickerView.delegate = self
        
        problemLabel.text = whywhyAnalysis.problem
        measuresLabel.text = whywhyAnalysis.measures
        if(mode == "新規作成") {
            status = statusList[0]
            statusNum = 0
        } else if(mode == "編集") {
            status = whywhyAnalysis.status
            for s in statusList {
                if(s == status) {
                    break
                }
                statusNum += 1
            }
        }
        
        self.statusPickerView.selectRow(statusNum, inComponent: 0, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusList.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return statusList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        status = statusList[row]
        
    }
    
    // 何故何故分析を登録
    @IBAction func registAnalysis(_ sender: Any) {
        whywhyAnalysis.status = status
        
        let data = DataStorage()
        switch mode {
        case "新規作成":
            data.createWhyAnalyticsData(whywhyAnalysis)
            break
        case "編集":
            data.editWhyAnalyticsData(whywhyAnalysis)
            break
        default:
            // TODO: 後ほどエラー処理またはアラート処理を実装
            print("エラー")
            break
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
