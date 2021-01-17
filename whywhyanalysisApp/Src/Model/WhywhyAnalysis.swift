//
//  whywhyanalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/09.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

internal class WhywhyAnalysis: Object {
    // 何故何故分析No.(PRIMARY KEY)
    @objc dynamic internal var whywhyAnalysisNo: Int = 0
    // 問題
    @objc dynamic internal var problem: String!
    // 対策
    @objc dynamic internal var measures: String!
    // 1WHY
    @objc dynamic internal var oneWhy: String!
    // 2WHY
    @objc dynamic internal var twoWhy: String!
    // 3WHY
    @objc dynamic internal var threeWhy: String!
    // 4WHY
    @objc dynamic internal var fourWhy: String!
    // 5WHY
    @objc dynamic internal var fiveWhy: String!
    // 分析回数
    @objc dynamic internal var whywhyanalysiscount = ""
    //
    @objc dynamic internal var status: String!

    override internal static func primaryKey() -> String? {
        return "whywhyAnalysisNo"
    }

    internal convenience init(problem: String, measures: String, oneWhy: String,
                     twoWhy: String, threeWhy: String, fourWhy: String,
                     fiveWhy: String, status: String) {
        self.init()
        self.problem = problem
        self.measures = measures
        self.oneWhy = oneWhy
        self.twoWhy = twoWhy
        self.threeWhy = threeWhy
        self.fourWhy = fourWhy
        self.fiveWhy = fiveWhy
        self.status = status
    }
}
