//
//  EditAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class EditAnalysisViewController: UIViewController {
    var whywhyAnalysis: WhywhyAnalysis!
    var analysisView: ViewWhywhyAnalysis!
    var mode = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        analysisView = (Bundle.main.loadNibNamed("ViewWhywhyAnalysis", owner: self, options: nil)!.first! as? ViewWhywhyAnalysis)
        analysisView.mode = mode
        analysisView.confirmButton.addTarget(self, action: #selector(self.goRegistClick(btn:)), for: .touchUpInside)

        if(analysisView.mode == "編集") {
            analysisView.whywhyAnalysis = whywhyAnalysis
            analysisView.problemTextField.text = whywhyAnalysis.problem
            analysisView.oneWhyTextFiled.text = whywhyAnalysis.oneWhy
            analysisView.measuresTextField.text = whywhyAnalysis.measures

            if(whywhyAnalysis.twoWhy != nil) {
                analysisView.twoWhyTextField.text = whywhyAnalysis.twoWhy
            }
            if(whywhyAnalysis.threeWhy != nil) {
                analysisView.threeWhyTextField.text = whywhyAnalysis.threeWhy
            }
            if(whywhyAnalysis.fourWhy != nil) {
                analysisView.fourWhyTextField.text = whywhyAnalysis.fourWhy
            }
            if(whywhyAnalysis.fiveWhy != nil) {
                analysisView.fiveWhyTextField.text = whywhyAnalysis.fiveWhy
            }
            analysisView.confirmButton.setTitle("編集", for: UIControl.State.normal)
        } else {
            analysisView.confirmButton.setTitle("登録", for: UIControl.State.normal)
        }
        self.view.addSubview(analysisView)
    }

    @objc func goRegistClick(btn: UIButton) {
        if (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.problemTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.oneWhyTextFiled.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.measuresTextField.text)) {
            // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
            var twoWhy = ""
            var threeWhy = ""
            var fourWhy = ""
            var fiveWhy = ""
            let status = "実施中"

            if(ValidateUtility.isTextNotEmplyCheck(optinalText:analysisView.twoWhyTextField.text)) {
                twoWhy = analysisView.twoWhyTextField.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.threeWhyTextField.text)) {
                threeWhy = analysisView.threeWhyTextField.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.fourWhyTextField.text)) {
                fourWhy = analysisView.fourWhyTextField.text!
            }
            if(ValidateUtility.isTextNotEmplyCheck(optinalText: analysisView.fiveWhyTextField.text)) {
                fiveWhy = analysisView.fiveWhyTextField.text!
            }
            // 修正後の内容で初期化
            let editWhywhyAnalysis = WhywhyAnalysis(problem: analysisView.problemTextField.text!, measures: analysisView.measuresTextField.text!, oneWhy: analysisView.oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy, status: status)
            // 画面遷移
            let nextViewController = R.storyboard.main.resistAnalysis()
            nextViewController?.whywhyAnalysis = editWhywhyAnalysis

            if(mode == "編集") {
                nextViewController?.whywhyAnalysis.whywhyAnalysisNo = whywhyAnalysis.whywhyAnalysisNo
                nextViewController?.whywhyAnalysis.status = whywhyAnalysis.status
            }
            nextViewController?.mode = analysisView.mode
            if nextViewController != nil {
                navigationController?.pushViewController(nextViewController!, animated: true)
            } else {
                // TODO: 後ほどアラート処理を実装
                print("失敗")
            }
        }
    }
}
