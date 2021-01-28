//
//  EditAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class EditAnalysisViewController: UIViewController {
    internal var whywhyAnalysis: WhywhyAnalysis?
    internal var analysisView: ViewWhywhyAnalysis?
    internal var mode = ""

    override internal func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        analysisView = (Bundle.main.loadNibNamed("ViewWhywhyAnalysis", owner: self, options: nil)?.first as? ViewWhywhyAnalysis)

        if let analysisView = analysisView {
            analysisView.mode = mode
            analysisView.confirmButton.addTarget(self, action: #selector(self.goRegistClick(btn:)), for: .touchUpInside)

            if analysisView.mode == "編集" {
                if let whywhyAnalysis = whywhyAnalysis {
                    analysisView.whywhyAnalysis = whywhyAnalysis
                    analysisView.problemTextField.text = whywhyAnalysis.problem
                    analysisView.oneWhyTextFiled.text = whywhyAnalysis.oneWhy
                    analysisView.measuresTextField.text = whywhyAnalysis.measures

                    if whywhyAnalysis.twoWhy != nil {
                        analysisView.twoWhyTextField.text = whywhyAnalysis.twoWhy
                    }
                    if whywhyAnalysis.threeWhy != nil {
                        analysisView.threeWhyTextField.text = whywhyAnalysis.threeWhy
                    }
                    if whywhyAnalysis.fourWhy != nil {
                        analysisView.fourWhyTextField.text = whywhyAnalysis.fourWhy
                    }
                    if whywhyAnalysis.fiveWhy != nil {
                        analysisView.fiveWhyTextField.text = whywhyAnalysis.fiveWhy
                    }
                }
                analysisView.confirmButton.setTitle("編集", for: UIControl.State.normal)
            } else {
                analysisView.confirmButton.setTitle("登録", for: UIControl.State.normal)
            }
            self.view.addSubview(analysisView)
        }
    }

    @objc
    private func goRegistClick(btn: UIButton) {
        if let analysisView = analysisView {
            if (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.problemTextField.text))
                && (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.oneWhyTextFiled.text))
                && (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.measuresTextField.text)) {
                // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
                var twoWhy = ""
                var threeWhy = ""
                var fourWhy = ""
                var fiveWhy = ""
                let status = "実施中"

                if ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.twoWhyTextField.text) {
                    // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                    // swiftlint:disable:next force_unwrapping
                    twoWhy = analysisView.twoWhyTextField.text!
                }
                if ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.threeWhyTextField.text) {
                    // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                    // swiftlint:disable:next force_unwrapping
                    threeWhy = analysisView.threeWhyTextField.text!
                }
                if ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.fourWhyTextField.text) {
                    // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                    // swiftlint:disable:next force_unwrapping
                    fourWhy = analysisView.fourWhyTextField.text!
                }
                if ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.fiveWhyTextField.text) {
                    // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                    // swiftlint:disable:next force_unwrapping
                    fiveWhy = analysisView.fiveWhyTextField.text!
                }
                // 修正後の内容で初期化
                // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                // swiftlint:disable:next force_unwrapping
                let editWhywhyAnalysis = WhywhyAnalysis(problem: analysisView.problemTextField.text!, measures: analysisView.measuresTextField.text!, oneWhy: analysisView.oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy, status: status)
                // 画面遷移
                let nextViewController = R.storyboard.main.resistAnalysis()

                if let nextVC = nextViewController {
                    nextVC.whywhyAnalysis = editWhywhyAnalysis

                    if mode == "編集" {
                        if let analysis = whywhyAnalysis {
                        nextVC.whywhyAnalysis?.whywhyAnalysisNo = analysis.whywhyAnalysisNo
                        nextVC.whywhyAnalysis?.status = analysis.status
                        }
                    }
                    nextVC.mode = analysisView.mode
                    navigationController?.pushViewController(nextVC, animated: true)
                } else {
                    // TODO: 後ほどアラート処理を実装
                }
            }
        }
    }
}
