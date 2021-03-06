//
//  whywhyanalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/09.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

internal class Analysis: Object {
    // 何故何故分析No.(PRIMARY KEY)
    @objc internal dynamic var whywhyAnalysisNo: Int = 0
    // 問題
    @objc internal dynamic var problem: String?
    // 対策
    @objc internal dynamic var measures: String?
    // 1WHY
    @objc internal dynamic var oneWhy: String?
    // 2WHY
    @objc internal dynamic var twoWhy: String?
    // 3WHY
    @objc internal dynamic var threeWhy: String?
    // 4WHY
    @objc internal dynamic var fourWhy: String?
    // 5WHY
    @objc internal dynamic var fiveWhy: String?
    // 分析回数
    @objc internal dynamic var whywhyanalysiscount = ""
    // ステータス
    @objc internal dynamic var status: String?
    // 対策最終日
    @objc internal dynamic var lastDate: Date?
    // 対策最終日通知id
    @objc internal dynamic var lastDateNotificationId: String?

    internal convenience init(problem: String, measures: String, oneWhy: String,
                              twoWhy: String, threeWhy: String, fourWhy: String,
                              fiveWhy: String, status: String, lastDate: Date, lastDateNotificationId: String) {
        self.init()
        self.problem = problem
        self.measures = measures
        self.oneWhy = oneWhy
        self.twoWhy = twoWhy
        self.threeWhy = threeWhy
        self.fourWhy = fourWhy
        self.fiveWhy = fiveWhy
        self.status = status
        self.lastDate = lastDate
        self.lastDateNotificationId = lastDateNotificationId
    }

    override internal static func primaryKey() -> String? {
        "whywhyAnalysisNo"
    }
}
