//
//  EditWhywhyAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class EditWhywhyAnalysisViewController: UIViewController {
    var whywhyAnalysis: WhywhyAnalysis!
    var cell: WhywhyAnalysisCell!
    var mode = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        cell = (Bundle.main.loadNibNamed("WhywhyAnalysisCell", owner: self, options: nil)!.first! as? WhywhyAnalysisCell)
        if cell != nil {
            cell.mode = mode
            cell.confirmButton.addTarget(self, action: #selector(self.confirmClick(btn:)), for: .touchUpInside)

            if cell.mode == "編集" {
                cell.whywhyAnalysis = whywhyAnalysis
                cell.problemTextField.text = whywhyAnalysis.problem
                cell.oneWhyTextFiled.text = whywhyAnalysis.oneWhy
                cell.measuresTextField.text = whywhyAnalysis.measures

                if whywhyAnalysis.twoWhy != nil {
                    cell.twoWhyTextField.text = whywhyAnalysis.twoWhy
                }
                if whywhyAnalysis.threeWhy != nil {
                    cell.threeWhyTextField.text = whywhyAnalysis.threeWhy
                }
                if whywhyAnalysis.fourWhy != nil {
                    cell.fourWhyTextField.text = whywhyAnalysis.fourWhy
                }
                if whywhyAnalysis.fiveWhy != nil {
                    cell.fiveWhyTextField.text = whywhyAnalysis.fiveWhy
                }
            }
        }
        self.view.addSubview(cell)
    }

    @objc func confirmClick(btn: UIButton) {
        if (ValidateUtility.isTextNotEmplyCheck(optinalText: cell.problemTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: cell.oneWhyTextFiled.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: cell.measuresTextField.text)) {
            // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
            var twoWhy = ""
            var threeWhy = ""
            var fourWhy = ""
            var fiveWhy = ""

            if ValidateUtility.isTextNotEmplyCheck(optinalText:cell.twoWhyTextField.text) {
                twoWhy = cell.twoWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: cell.threeWhyTextField.text) {
                threeWhy = cell.threeWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: cell.fourWhyTextField.text) {
                fourWhy = cell.fourWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: cell.fiveWhyTextField.text) {
                fiveWhy = cell.fiveWhyTextField.text!
            }
            let whywhyAnalysis = WhywhyAnalysis(problem: cell.problemTextField.text!, measures: cell.measuresTextField.text!, oneWhy: cell.oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy)
            let nextViewController = R.storyboard.main.resistAnalysis()
            nextViewController?.whywhyAnalysis = whywhyAnalysis
            nextViewController?.mode = cell.mode
            if nextViewController != nil {
                navigationController?.pushViewController(nextViewController!, animated: true)
            } else {
                print("失敗")
            }
        }
    }
}
