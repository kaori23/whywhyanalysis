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

    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var inProgressButton: UIButton!
    @IBOutlet internal weak var achieveButton: UIButton!
    @IBOutlet internal weak var notAchievedButton: UIButton!
    @IBOutlet internal weak var confirmButton: UIButton!
    // 必要項目に全て値が入っている事前提で作るため、画面遷移前に値が入っているかチェックが必要
    override internal func viewDidLoad() {
        super.viewDidLoad()

        inProgressButton.backgroundColor = .gray
        achieveButton.backgroundColor = .gray
        notAchievedButton.backgroundColor = .gray

        if let whywhyAnalysis = whywhyAnalysis {
            if ValidateUtility.isTextNotEmplyCheck(optinalText: whywhyAnalysis.problem) {
                problemLabel.text = whywhyAnalysis.problem
            } else {
                // エラー処理
            }

            if ValidateUtility.isTextNotEmplyCheck(optinalText: whywhyAnalysis.measures) {
                measuresLabel.text = whywhyAnalysis.measures
            } else {
                // エラー処理
            }

            switch whywhyAnalysis.status {
            case "実施中":
                inProgressButton.backgroundColor = .blue
            case "達成":
                achieveButton.backgroundColor = .blue
            case "未達成":
                notAchievedButton.backgroundColor = .blue

            default:
                // TODO: エラー処理
                print("エラー処理")
            }
        }

        // Do any additional setup after loading the view.
    }

    @IBAction private func selectInProgressButton(_ sender: Any) {
        inProgressButton.backgroundColor = .blue
        achieveButton.backgroundColor = .gray
        notAchievedButton.backgroundColor = .gray
        status = "実施中"
    }

    @IBAction private func selectAchieveButton(_ sender: Any) {
        inProgressButton.backgroundColor = .gray
        achieveButton.backgroundColor = .blue
        notAchievedButton.backgroundColor = .gray
        status = "達成"
    }

    @IBAction private func selectNotAchievedButton(_ sender: Any) {
        inProgressButton.backgroundColor = .gray
        achieveButton.backgroundColor = .gray
        notAchievedButton.backgroundColor = .blue
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
                view.configureContent(title: "sucess", body: "ステータスの変更が完了しました")
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
