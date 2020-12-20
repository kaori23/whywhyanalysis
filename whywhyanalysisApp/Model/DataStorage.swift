//
//  DataStorage.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

class DataStorage {
        var itemList: Results<WhywhyAnalysis>!
    
    // 全項目全件取得
    func loadAllWhyAnalyticsData() -> Array<WhywhyAnalysis> {
        // データベースからデータを取得
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        let realm = try! Realm(configuration: config)
         itemList = realm.objects(WhywhyAnalysis.self)
        return Array(itemList)
    }
    
    // 新規何故何故分析を追加
    func createWhyAnalyticsData(_ analysis:WhywhyAnalysis) {
        // WhywhyAnalysisNoの最大値
        let maxWhywhyAnalysisNo = try! Realm().objects(WhywhyAnalysis.self).sorted(byKeyPath: "whywhyAnalysisNo").last?.whywhyAnalysisNo
        if maxWhywhyAnalysisNo != nil {
            analysis.whywhyAnalysisNo = maxWhywhyAnalysisNo! + 1
        } else {
            analysis.whywhyAnalysisNo = 1
        }
        // Realmデータベースを取得
        let realm = try! Realm()
        // データベースに追加
        try! realm.write {
            realm.add(analysis)
        }
    }
    
    // 何故何故分析を編集
    func editWhyAnalyticsData(_ analysis:WhywhyAnalysis) {
        // Realmデータベースを取得
        let realm = try! Realm()
        try! realm.write {
            realm.add(analysis, update: .all)
        }
    }
    
    // 特定の何故何故分析を取得
    func loadWhywhyAnalytics(_ whywhyAnalysisNo:Int) -> WhywhyAnalysis {
        // Realmデータベースを取得
        let realm = try! Realm()
        let analysisList =  realm.objects(WhywhyAnalysis.self).filter("whywhyAnalysisNo == %@", whywhyAnalysisNo)
        
        return analysisList[0]
    }
    
}
