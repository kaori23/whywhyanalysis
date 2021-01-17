//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class RegistAnalysisViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var statusPickerView: UIPickerView!
    @IBOutlet internal weak var confirmButton: UIButton!
    internal let statusList = ["実施中", "達成", "未達成"]
    internal var whywhyAnalysis: WhywhyAnalysis!
    internal var mode = ""
    internal var status = ""
    internal var statusNum = 0
    internal let buttonBgColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)

    override internal func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statusPickerView.dataSource = self
        statusPickerView.delegate = self

        problemLabel.text = whywhyAnalysis.problem
        measuresLabel.text = whywhyAnalysis.measures
        if mode == "新規作成" {
            status = statusList[0]
            statusNum = 0
        } else if mode == "編集" {
            statusNum = statusList.firstIndex(of: whywhyAnalysis.status)!
        }
        self.statusPickerView.selectRow(statusNum, inComponent: 0, animated: false)
        confirmButton.backgroundColor = buttonBgColor
        confirmButton.tintColor = .white
    }

    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusList.count
    }

    internal func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return statusList[row]
    }

    internal func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        status = statusList[row]
    }

    // 何故何故分析を登録
    @IBAction internal func registAnalysis(_ sender: Any) {
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
            break
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
