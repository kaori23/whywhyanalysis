//
//  EditAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class EditAnalysisViewController: UIViewController, UITextFieldDelegate {
    internal var whywhyAnalysis: Analysis?
    internal var analysisView: EditAnalysis?
    internal var mode: AnalysisDivision?

    override internal func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        analysisView = (Bundle.main.loadNibNamed("EditAnalysis", owner: self, options: nil)?.first as? EditAnalysis)

        if let analysisView = analysisView {
            analysisView.problemTextField.delegate = self
            analysisView.oneWhyTextFiled.delegate = self
            analysisView.twoWhyTextField.delegate = self
            analysisView.threeWhyTextField.delegate = self
            analysisView.fourWhyTextField.delegate = self
            analysisView.fiveWhyTextField.delegate = self
            analysisView.measuresTextField.delegate = self

            analysisView.mode = mode
            analysisView.confirmButton.addTarget(self, action: #selector(self.goRegistClick(btn:)), for: .touchUpInside)

            if analysisView.mode == .edit {
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
                analysisView.confirmButton.setTitle(AnalysisDivision.edit.rawValue, for: UIControl.State.normal)
            } else {
                analysisView.confirmButton.setTitle(AnalysisDivision.new.rawValue, for: UIControl.State.normal)
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
                let status = AnalysisStatus.inProgress.rawValue

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
                let editWhywhyAnalysis = Analysis(problem: analysisView.problemTextField.text!, measures: analysisView.measuresTextField.text!, oneWhy: analysisView.oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy, status: status)
                // 画面遷移
                let nextViewController = R.storyboard.main.resistAnalysis()

                if let nextVC = nextViewController {
                    nextVC.whywhyAnalysis = editWhywhyAnalysis

                    if mode == .edit {
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
            } else {
                // 警告ポップアップ処理
                let alertController = UIAlertController(title: "エラー", message: "問題内容または分析内容、対策内容は必須です", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }

    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // キーボードをしまう
            self.view.endEditing(true)

            return true
        }
}
