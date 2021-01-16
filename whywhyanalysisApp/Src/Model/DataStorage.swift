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
        do {
            let realm = try? Realm(configuration: config)
            itemList = realm?.objects(WhywhyAnalysis.self)
        } catch {
        }
        return Array(itemList)
    }

    // 新規何故何故分析を追加
    func createWhyAnalyticsData(_ analysis:WhywhyAnalysis) {
        // WhywhyAnalysisNoの最大値
        let maxWhywhyAnalysisNo = try? Realm().objects(WhywhyAnalysis.self).sorted(byKeyPath: "whywhyAnalysisNo").last?.whywhyAnalysisNo
        if maxWhywhyAnalysisNo != nil {
            analysis.whywhyAnalysisNo = maxWhywhyAnalysisNo! + 1
        } else {
            analysis.whywhyAnalysisNo = 1
        }
        do {
            // Realmデータベースを取得
            let realm = try? Realm()
            // データベースに追加
            try? realm?.write {
                realm?.add(analysis)
            }
        } catch {
        }
    }

    // 何故何故分析を編集
    func editWhyAnalyticsData(_ analysis:WhywhyAnalysis) {
        // Realmデータベースを取得
        do {
            let realm = try? Realm()
            try? realm?.write {
                realm?.add(analysis, update: .all)
            }
        } catch {
        }
    }

    // 特定の何故何故分析を取得
    func loadWhywhyAnalytics(_ whywhyAnalysisNo:Int) -> WhywhyAnalysis {
        // Realmデータベースを取得
        var analysisList :Results<WhywhyAnalysis>!
        do {
            let realm = try? Realm()
            analysisList =  realm?.objects(WhywhyAnalysis.self).filter("whywhyAnalysisNo == %@", whywhyAnalysisNo)
        } catch {
            // TODO:
        }
        return analysisList[0]
    }

    // 特定の何故何故分析を削除
    func deleteWhywhyAnalytics(_ whywhyAnalysisNo:Int) {
        // Realmデータベースを取得
        do {
            let realm = try? Realm()
            let analysis =  realm?.objects(WhywhyAnalysis.self).filter("whywhyAnalysisNo == %@", whywhyAnalysisNo).first!
            if analysis != nil {
                try? realm?.write {
                    realm?.delete(analysis!)
                }
            }
        } catch {
            // TODO: 後ほどエラー処理を実装
        }
    }
}
