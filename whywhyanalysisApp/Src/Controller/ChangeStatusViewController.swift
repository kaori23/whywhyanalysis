//
//  ChangeStatusViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2021/02/02.
//  Copyright © 2021 長塚かおり. All rights reserved.
//

import SwiftMessages
import UIKit

internal class ChangeStatusViewController: UIViewController {
    internal var whywhyAnalysis: Analysis?
    internal var status: String?
    internal let backgroundColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)
    internal let contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 7.0)

    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var inProgressButton: UIButton!
    @IBOutlet internal weak var achieveButton: UIButton!
    @IBOutlet internal weak var notAchievedButton: UIButton!
    @IBOutlet internal weak var confirmButton: UIButton!

    override internal func viewDidLoad() {
        super.viewDidLoad()

        inProgressButton.backgroundColor = .gray
        inProgressButton.setTitleColor(UIColor.white, for: .normal)
        inProgressButton.contentEdgeInsets = contentEdgeInsets
        achieveButton.backgroundColor = .gray
        achieveButton.setTitleColor(UIColor.white, for: .normal)
        achieveButton.contentEdgeInsets = contentEdgeInsets
        notAchievedButton.backgroundColor = .gray
        notAchievedButton.setTitleColor(UIColor.white, for: .normal)
        notAchievedButton.contentEdgeInsets = contentEdgeInsets
        confirmButton.backgroundColor = UIColor(red: 70 / 255, green: 190 / 255, blue: 255 / 255, alpha: 1)
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.contentEdgeInsets = contentEdgeInsets

        if let whywhyAnalysis = whywhyAnalysis {
            if ValidateUtility.isTextNotEmplyCheck(optinalText: whywhyAnalysis.problem) {
                problemLabel.text = whywhyAnalysis.problem
            } else {
                // TODO: エラー処理
            }

            if ValidateUtility.isTextNotEmplyCheck(optinalText: whywhyAnalysis.measures) {
                measuresLabel.text = whywhyAnalysis.measures
            } else {
                // TODO: エラー処理
            }

            status = whywhyAnalysis.status

            switch status {
            case "実施中":
                inProgressButton.backgroundColor = backgroundColor
            case "達成":
                achieveButton.backgroundColor = backgroundColor
            case "未達成":
                notAchievedButton.backgroundColor = backgroundColor

            default:
                // TODO: エラー処理
                print("エラー処理")
            }
        }

        // Do any additional setup after loading the view.
    }

    @IBAction private func selectInProgressButton(_ sender: Any) {
        inProgressButton.backgroundColor = backgroundColor
        achieveButton.backgroundColor = .gray
        notAchievedButton.backgroundColor = .gray
        status = "実施中"
    }

    @IBAction private func selectAchieveButton(_ sender: Any) {
        inProgressButton.backgroundColor = .gray
        achieveButton.backgroundColor = backgroundColor
        notAchievedButton.backgroundColor = .gray
        status = "達成"
    }

    @IBAction private func selectNotAchievedButton(_ sender: Any) {
        inProgressButton.backgroundColor = .gray
        achieveButton.backgroundColor = .gray
        notAchievedButton.backgroundColor = backgroundColor
        status = "未達成"
    }

    @IBAction private func changeStatusConfirmButton(_ sender: Any) {
        if let whywhyAnalysis = whywhyAnalysis {
            if let status = status {
                let data = DataStorage()
                data.changeStatusAnalytics(status, whywhyAnalysis.whywhyAnalysisNo)

                let view = MessageView.viewFromNib(layout: .messageView)
                view.configureTheme(.success)
                view.configureDropShadow()
                view.configureContent(title: "sucess", body: "ステータスを\(status)に変更しました")
                view.button?.isHidden = true
                view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
                SwiftMessages.show(view: view)
            } else {
                // TODO: 後ほどエラー処理を実装 statusがnilの時
            }
        } else {
            // TODO: 後ほどエラー処理を実装 whywhyAnalysisがnilの時
        }
    }
}
