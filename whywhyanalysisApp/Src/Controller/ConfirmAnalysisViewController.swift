//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class ConfirmAnalysisViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    internal let statusList = [AnalysisStatus.inProgress.rawValue, AnalysisStatus.achieve.rawValue, AnalysisStatus.notAchieved.rawValue]
    internal var whywhyAnalysis: Analysis?
    internal var mode: AnalysisDivision?
    internal var status = ""
    internal var statusNum = 0
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var statusPickerView: UIPickerView!
    @IBOutlet internal weak var confirmButton: UIButton!
    @IBOutlet internal weak var wordingLabel: UILabel!

    @IBOutlet internal weak var problemtitleLabel: UILabel!
    @IBOutlet internal weak var measuresTitleLabel: UILabel!
    @IBOutlet internal weak var statusPickerTitleLabel: UILabel!

    override internal func viewDidLoad() {
        super.viewDidLoad()
        //　配色設定
        self.view.backgroundColor = UIColor.white
        wordingLabel.textColor = UIColor.black
        problemtitleLabel.textColor = UIColor.black
        problemLabel.textColor = UIColor.black
        measuresTitleLabel.textColor = UIColor.black
        measuresLabel.textColor = UIColor.black
        statusPickerTitleLabel.textColor = UIColor.black

        statusPickerView.dataSource = self
        statusPickerView.delegate = self

        if let whywhyAnalysis = whywhyAnalysis {
            problemLabel.text = whywhyAnalysis.problem
            measuresLabel.text = whywhyAnalysis.measures
            if mode == .new {
                status = statusList[0]
                statusNum = 0
            } else if mode == .edit {
                if let analysisStatus = whywhyAnalysis.status {
                    status = analysisStatus
                    statusNum = statusList.firstIndex(of: analysisStatus) ?? 0
                }
            }
        }
        self.statusPickerView.selectRow(statusNum, inComponent: 0, animated: false)
        confirmButton.backgroundColor = AppColor.btnBgColor
        confirmButton.tintColor = .white
    }

    // 何故何故分析を登録
    @IBAction private func registAnalysis(_ sender: Any) {
        if let whywhyAnalysis = whywhyAnalysis {
            whywhyAnalysis.status = status
            let data = DataStorage()
            switch mode {
            case .new:
                data.createWhyAnalyticsData(whywhyAnalysis)

            case .edit:
                data.editWhyAnalyticsData(whywhyAnalysis)

            default:
                // TODO: 後ほどエラー処理またはアラート処理を実装
                break
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

    @objc
    private func back(_ sender: Any) {
        let nav = self.navigationController
        // swiftlint:disable:next force_unwrapping
        let editAnalysisViewController = nav?.viewControllers[((nav?.viewControllers.count)!) - 2] as? EditAnalysisViewController
        // 値を渡す
        editAnalysisViewController?.whywhyAnalysis = whywhyAnalysis
        navigationController?.popViewController(animated: true)
    }

    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        statusList.count
    }

    internal func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
         // 表示するラベルを生成する
         let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
         label.textAlignment = .center
         label.text = statusList[row]
         label.textColor = UIColor.black
         return label
     }

    internal func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int, inComponent component: Int) {
        status = statusList[row]
    }
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}
