//
//  whywhyanalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/09.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

class Whywhyanalysis: Object {
    // 問題
    @objc dynamic var problem = ""
    // 対策
    @objc dynamic var measures = ""
    
    // 1WHY
    @objc dynamic var oneWhy = ""
    
    // 2WHY
    @objc dynamic var twoWhy = ""
    
    // 3WHY
    @objc dynamic var threeWhy = ""
    
    // 4WHY
    @objc dynamic var fourWhy = ""
    
    // 5WHY
    @objc dynamic var fiveWhy = ""
    
    // 分析回数
    @objc dynamic var whywhyanalysiscount = ""
    
}

