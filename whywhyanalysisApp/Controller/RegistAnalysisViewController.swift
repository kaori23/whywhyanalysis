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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        problemLabel.text = whywhyAnalysis.problem
        measuresLabel.text = whywhyAnalysis.measures
    }

    // 何故何故分析を登録
    @IBAction func registAnalysis(_ sender: Any) {
        let data = DataStorage()
        switch mode {
        case "新規作成":
            data.createWhyAnalyticsData(whywhyAnalysis)
            break
        case "編集":
            // TODO: 後ほど編集する処理を実装
            print("編集する")
            break
        default:
            // TODO: 後ほどエラー処理またはアラート処理を実装
            print("エラー")
            break
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
