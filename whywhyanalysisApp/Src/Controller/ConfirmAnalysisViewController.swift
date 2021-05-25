//
//  RegistAnalysisViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit
import UserNotifications

internal class ConfirmAnalysisViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UNUserNotificationCenterDelegate {
    internal let statusList = [AnalysisStatus.inProgress.rawValue, AnalysisStatus.achieve.rawValue, AnalysisStatus.notAchieved.rawValue]
    internal var whywhyAnalysis: Analysis?
    internal var mode: AnalysisDivision?
    internal var status = ""
    internal var statusNum = 0
    internal let dateFormatter = DateFormatter()
    internal let calendar = Calendar(identifier: .gregorian)
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var statusPickerView: UIPickerView!
    @IBOutlet internal weak var confirmButton: UIButton!
    @IBOutlet internal weak var wordingLabel: UILabel!

    @IBOutlet internal weak var problemtitleLabel: UILabel!
    @IBOutlet internal weak var measuresTitleLabel: UILabel!
    @IBOutlet internal weak var statusPickerTitleLabel: UILabel!
    @IBOutlet internal weak var deadlineTitleLabel: UILabel!
    @IBOutlet internal weak var datePicker: UIDatePicker!
    @IBOutlet internal weak var lastdayNotificationTitleLabel: UILabel!
    @IBOutlet internal weak var lastdayNotificationSwitch: UISwitch!
    @IBOutlet internal weak var wordingView: UIView!
    @IBOutlet internal weak var problemView: UIView!
    @IBOutlet internal weak var measuresView: UIView!
    @IBOutlet internal weak var statusView: UIView!
    @IBOutlet internal weak var deadlineView: UIView!
    @IBOutlet internal weak var switchesView: UIView!
    @IBOutlet internal weak var registView: UIView!

    override internal func viewDidLoad() {
        super.viewDidLoad()
        doInitLayout()
        doinitDateFormat()
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
                if let lastDate = whywhyAnalysis.lastDate {
                    datePicker.date = lastDate
                }
                if whywhyAnalysis.lastDateNotificationId != nil {
                    lastdayNotificationSwitch.isOn = true
                } else {
                    lastdayNotificationSwitch.isOn = false
                }
            }
        }
        self.statusPickerView.selectRow(statusNum, inComponent: 0, animated: false)
    }

    // 何故何故分析を登録
    @IBAction private func registAnalysis(_ sender: Any) {
        let lastY = calendar.component(.year, from: datePicker.date)
        let lastM = calendar.component(.month, from: datePicker.date)
        let lastD = calendar.component(.day, from: datePicker.date)
        let lastDateComponents = DateComponents(year: lastY, month: lastM, day: lastD)

        // 日付チェック
        if let lastDate = calendar.date(from: lastDateComponents) {
            if isCheckedAfterDate(selectDate: lastDate) {
                if let whywhyAnalysis = whywhyAnalysis {
                    // 値の設定
                    // ステータス
                    whywhyAnalysis.status = status
                    // 対策最終日
                    whywhyAnalysis.lastDate = lastDate
                    // 対策最終日通知
                    if lastdayNotificationSwitch.isOn {
                        // 最終日通知再設定
                        if let lastDateNotificationId = whywhyAnalysis.lastDateNotificationId {
                            removeLastdayNotificationFunc(id: lastDateNotificationId)
                        }
                        let id = registerLastdayNotificationFunc(lastDateComponents: lastDateComponents)
                        whywhyAnalysis.lastDateNotificationId = id
                    } else {
                        if let lastDateNotificationId = whywhyAnalysis.lastDateNotificationId {
                            removeLastdayNotificationFunc(id: lastDateNotificationId)
                        }
                    }

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
                }
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                PartsUtility.createAlert(alertType: "error", alertTitle: "error", alertBody: "期日は本日以降にしてください")
            }
        }
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

    private func doInitLayout() {
        wordingView.backgroundColor = UIColor.white
        problemView.backgroundColor = UIColor.white
        measuresView.backgroundColor = UIColor.white
        statusView.backgroundColor = UIColor.white
        deadlineView.backgroundColor = UIColor.white
        switchesView.backgroundColor = UIColor.white
        registView.backgroundColor = UIColor.white
        wordingLabel.textColor = UIColor.black
        problemtitleLabel.textColor = UIColor.black
        problemLabel.textColor = UIColor.black
        measuresTitleLabel.textColor = UIColor.black
        measuresLabel.textColor = UIColor.black
        statusPickerTitleLabel.textColor = UIColor.black
        deadlineTitleLabel.textColor = UIColor.black
        lastdayNotificationTitleLabel.textColor = UIColor.black
        confirmButton.backgroundColor = AppColor.btnBgColor
        confirmButton.tintColor = .white
        datePicker.setValue(UIColor.black, forKeyPath: "textColor")
        datePicker.setValue(false, forKey: "highlightsToday")
    }

    private func doinitDateFormat() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        // 端末のロケールや暦法設定に左右されないように設定
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        // 画面の表示内容を日本にする為設定
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
    }

    // 毎日通知機能
    private func everydayNotificationFunc() -> String {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "本日の対策は実施しましたか？"
        content.sound = UNNotificationSound.default

        let date = DateComponents(hour: 22, minute: 3)
        let id = registerNotificationFunc(content: content, dateMatching: date)
        return id
    }

    // 対策最終日通知登録機能
    private func registerLastdayNotificationFunc(lastDateComponents: DateComponents) -> String {
        // タイトル、本文の設定
        let content = UNMutableNotificationContent()
        content.title = "対策実施最終日になりました"
        content.subtitle = "実施結果を選択してください"
        content.sound = UNNotificationSound.default
        //　通知時刻の設定
        var dateMatching = lastDateComponents
        dateMatching.hour = 19
        dateMatching.minute = 00

        let id = registerNotificationFunc(content: content, dateMatching: dateMatching)
        return id
    }

    // 通知登録機能
    private func registerNotificationFunc(content: UNMutableNotificationContent, dateMatching: DateComponents) -> String {
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateMatching, repeats: false)
        let id = NSUUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        return id
    }

    // 未実行の通知の中から特定の通知を削除
    private func removeLastdayNotificationFunc(id: String) {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
            for request in requests
            where request.identifier == id {
                center.removePendingNotificationRequests(withIdentifiers: [id])
            }
        }
    }

    internal func isCheckedAfterDate(selectDate: Date) -> Bool {
        var flag = false
        let nowY = calendar.component(.year, from: Date())
        let nowM = calendar.component(.month, from: Date())
        let nowD = calendar.component(.day, from: Date())
        let nowDate = calendar.date(from: DateComponents(year: nowY, month: nowM, day: nowD))
        if let nowDate = nowDate {
            if selectDate >= nowDate {
                flag = true
            } else {
                flag = false
            }
        }
        return flag
    }

    // フォアグラウンドの場合でも通知を表示
    internal func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
