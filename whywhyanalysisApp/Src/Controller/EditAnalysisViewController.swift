//
//  EditAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class EditAnalysisViewController: UIViewController {
    internal var whywhyAnalysis: Analysis?
    internal var mode: AnalysisDivision?

    @IBOutlet internal weak var measuresView: UIView!
    @IBOutlet internal weak var confirmView: UIView!
    @IBOutlet internal weak var oneWHYLabel: UILabel!
    @IBOutlet internal weak var twoWHYLabel: UILabel!
    @IBOutlet internal weak var threeWHYLabel: UILabel!
    @IBOutlet internal weak var fourWHYLabel: UILabel!
    @IBOutlet internal weak var fiveWHYLabel: UILabel!
    @IBOutlet internal weak var problemTextField: UITextField!
    @IBOutlet internal weak var oneWhyTextFiled: UITextField!
    @IBOutlet internal weak var twoWhyTextField: UITextField!
    @IBOutlet internal weak var threeWhyTextField: UITextField!
    @IBOutlet internal weak var fourWhyTextField: UITextField!
    @IBOutlet internal weak var fiveWhyTextField: UITextField!
    @IBOutlet internal weak var measuresTextField: UITextField!

    @IBOutlet internal weak var problemView: UIView!
    @IBOutlet internal weak var oneAnalysisView: UIView!
    @IBOutlet internal weak var twoAnalysisView: UIView!
    @IBOutlet internal weak var threeAnalysisView: UIView!
    @IBOutlet internal weak var fourAnalysisView: UIView!
    @IBOutlet internal weak var fiveAnalysisView: UIView!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var confirmButton: UIButton!
    @IBOutlet internal weak var oneArrow: UIImageView!
    @IBOutlet internal weak var twoArrow: UIImageView!
    @IBOutlet internal weak var threeArrow: UIImageView!
    @IBOutlet internal weak var fourArrow: UIImageView!
    @IBOutlet internal weak var fiveArrow: UIImageView!

    override internal func viewDidLoad() {
        super.viewDidLoad()
        // レイアウト設定
        self.view.backgroundColor = UIColor.white
        measuresView.layer.backgroundColor = UIColor.white.cgColor
        confirmView.layer.backgroundColor =
            UIColor.white.cgColor

        problemTextField.backgroundColor =
            UIColor.white
        problemTextField.textColor = UIColor.black

        oneWHYLabel.textColor = AppColor.whyLabelTextColor
        oneWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        oneWhyTextFiled.textColor = UIColor.black
        oneWhyTextFiled.backgroundColor = UIColor.white

        twoWHYLabel.textColor = AppColor.whyLabelTextColor
        twoWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        twoWhyTextField.textColor = UIColor.black
        twoWhyTextField.backgroundColor = UIColor.white

        threeWHYLabel.textColor = AppColor.whyLabelTextColor
        threeWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        threeWhyTextField.textColor = UIColor.black
        threeWhyTextField.backgroundColor = UIColor.white

        fourWHYLabel.textColor = AppColor.whyLabelTextColor
        fourWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        fourWhyTextField.textColor = UIColor.black
        fourWhyTextField.backgroundColor = UIColor.white

        fiveWHYLabel.textColor = AppColor.whyLabelTextColor
        fiveWHYLabel.backgroundColor = AppColor
            .whyLabelBgColor
        fiveWhyTextField.textColor = UIColor.black
        fiveWhyTextField.backgroundColor = UIColor.white

        oneArrow.tintColor = AppColor.mainColor
        twoArrow.tintColor = AppColor.mainColor
        threeArrow.tintColor = AppColor.mainColor
        fourArrow.tintColor = AppColor.mainColor
        fiveArrow.tintColor = AppColor.mainColor

        problemView.backgroundColor = AppColor.viewBgColor
        oneAnalysisView.backgroundColor = AppColor.viewBgColor
        twoAnalysisView.backgroundColor = AppColor.viewBgColor
        threeAnalysisView.backgroundColor = AppColor.viewBgColor
        fourAnalysisView.backgroundColor = AppColor.viewBgColor
        fiveAnalysisView.backgroundColor = AppColor.viewBgColor

        measuresLabel.textColor = .white
        measuresLabel.backgroundColor = AppColor.headingLabelBgColor
        measuresTextField.textColor = UIColor.black
        measuresTextField.backgroundColor = UIColor.white

        confirmButton.tintColor = .white
        confirmButton.backgroundColor = AppColor.btnBgColor

        // 初期値の設定
        if mode == .edit {
            if let whywhyAnalysis = whywhyAnalysis {
                problemTextField.text = whywhyAnalysis.problem
                oneWhyTextFiled.text = whywhyAnalysis.oneWhy
                measuresTextField.text = whywhyAnalysis.measures

                if whywhyAnalysis.twoWhy != nil {
                    twoWhyTextField.text = whywhyAnalysis.twoWhy
                }
                if whywhyAnalysis.threeWhy != nil {
                    threeWhyTextField.text = whywhyAnalysis.threeWhy
                }
                if whywhyAnalysis.fourWhy != nil {
                    fourWhyTextField.text = whywhyAnalysis.fourWhy
                }
                if whywhyAnalysis.fiveWhy != nil {
                    fiveWhyTextField.text = whywhyAnalysis.fiveWhy
                }
            }
            confirmButton.setTitle(AnalysisDivision.edit.rawValue, for: UIControl.State.normal)
        } else {
            confirmButton.setTitle(AnalysisDivision.new.rawValue, for: UIControl.State.normal)
        }
    }

    override internal func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if goRegistClick().0 {
            if segue.identifier == "resistAnalysis" {
                let nextViewController = segue.destination as? ConfirmAnalysisViewController
                if let nextVC = nextViewController {
                    if let mode = self.mode {
                        nextVC.mode = mode
                    } else {
                        nextVC.mode = AnalysisDivision.new
                    }
                    nextVC.whywhyAnalysis = goRegistClick().1
                }
            }
        }
    }

     private func goRegistClick() -> (Bool, Analysis) {
        if (ValidateUtility.isTextNotEmplyCheck(optinalText: problemTextField.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: oneWhyTextFiled.text))
            && (ValidateUtility.isTextNotEmplyCheck(optinalText: measuresTextField.text)) {
            // 2WHY以降は任意入力の為何も入力されていない場合は""を代入する
            var twoWhy = ""
            var threeWhy = ""
            var fourWhy = ""
            var fiveWhy = ""
            let status = AnalysisStatus.inProgress.rawValue
            let lastDate = Date()
            let lastDateNotificationId = ""

            if ValidateUtility.isTextNotEmplyCheck(optinalText: twoWhyTextField.text) {
                // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                // swiftlint:disable:next force_unwrapping
                twoWhy = twoWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: threeWhyTextField.text) {
                // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                // swiftlint:disable:next force_unwrapping
                threeWhy = threeWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: fourWhyTextField.text) {
                // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                // swiftlint:disable:next force_unwrapping
                fourWhy = fourWhyTextField.text!
            }
            if ValidateUtility.isTextNotEmplyCheck(optinalText: fiveWhyTextField.text) {
                // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
                // swiftlint:disable:next force_unwrapping
                fiveWhy = fiveWhyTextField.text!
            }
            // 修正後の内容で初期化
            // ValidateUtility.isTextNotEmplyCheckでnilチェックをしているので強制アンラップを許容
            // swiftlint:disable:next force_unwrapping
            let editWhywhyAnalysis = Analysis(problem: problemTextField.text!, measures: measuresTextField.text!, oneWhy: oneWhyTextFiled.text!, twoWhy: twoWhy, threeWhy: threeWhy, fourWhy: fourWhy, fiveWhy: fiveWhy, status: status, lastDate: lastDate, lastDateNotificationId: lastDateNotificationId)
            // 画面遷移
            let nextViewController = R.storyboard.main.resistAnalysis()
            if let nextVC = nextViewController {
                nextVC.whywhyAnalysis = editWhywhyAnalysis
                if mode == .edit {
                    if let analysis = whywhyAnalysis {
                        editWhywhyAnalysis.status = analysis.status
                        if let lastDate = analysis.lastDate {
                            editWhywhyAnalysis.lastDate = lastDate
                        }
                        if let lastDateNotificationId = analysis.lastDateNotificationId {
                            editWhywhyAnalysis.lastDateNotificationId = lastDateNotificationId
                        }
                    }
                }
                return (true, editWhywhyAnalysis)
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
        // whywhyAnalysisは使用しない為強制アンラップを許容
        // swiftlint:disable:next force_unwrapping
        return (false, whywhyAnalysis!)
    }
}
