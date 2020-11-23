//
//  whywhyanalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/09.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

class WhywhyAnalysis: Object {
    // 問題
    @objc dynamic var problem: String
    // 対策
    @objc dynamic var measures: String
    
    // 1WHY
    @objc dynamic var oneWhy: String
    
    // 2WHY
    @objc dynamic var twoWhy: String
    
    // 3WHY
    @objc dynamic var threeWhy: String
    
    // 4WHY
    @objc dynamic var fourWhy: String
    
    // 5WHY
    @objc dynamic var fiveWhy: String
    
//    // 分析回数
//    @objc dynamic var whywhyanalysiscount = ""
    
  convenience init(problem: String, measures: String, oneWhy: String,
         twoWhy: String, threeWhy: String, fourWhy:String, fiveWhy: String) {
        self.problem = ""
        self.measures = ""
        self.oneWhy = ""
        self.twoWhy = ""
        self.threeWhy = ""
        self.fourWhy = ""
        self.fiveWhy = ""
    }
}
