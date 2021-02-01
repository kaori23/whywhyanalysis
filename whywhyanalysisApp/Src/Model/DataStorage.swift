//
//  DataStorage.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation
import RealmSwift

internal class DataStorage {
       internal var analysisList: Results<Analysis>?

    // 全項目全件取得
    internal func loadAllWhyAnalyticsData() -> [Analysis] {
        // データベースからデータを取得
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        do {
            let realm = try Realm(configuration: config)
            analysisList = realm.objects(Analysis.self)
        } catch {
        }
        // HomeViewController側で表示を制御しているので強制アンラップを許容
        // swiftlint:disable:next force_unwrapping
        return Array(analysisList!)
    }

    // 新規何故何故分析を追加
    internal func createWhyAnalyticsData(_ analysis: Analysis) {
        do {
            // WhywhyAnalysisNoの最大値
            let maxAnalysisNo = try Realm().objects(Analysis.self).sorted(byKeyPath: "whywhyAnalysisNo").last?.whywhyAnalysisNo

            if let maxAnalysisNo = maxAnalysisNo {
                analysis.whywhyAnalysisNo = maxAnalysisNo + 1
            } else {
                analysis.whywhyAnalysisNo = 1
            }
            // Realmデータベースを取得
            let realm = try Realm()
            // データベースに追加
            try realm.write {
                realm.add(analysis)
            }
        } catch {
        }
    }

    // 何故何故分析を編集
    internal func editWhyAnalyticsData(_ analysis: Analysis) {
        // Realmデータベースを取得
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(analysis, update: .all)
            }
        } catch {
        }
    }

    // 特定の何故何故分析を取得
    internal func loadWhywhyAnalytics(_ whywhyAnalysisNo: Int) -> Analysis {
        // Realmデータベースを取得
        do {
            let realm = try Realm()
            analysisList = realm.objects(Analysis.self).filter("whywhyAnalysisNo == %@", whywhyAnalysisNo)
        } catch {
            // TODO:
        }
        // DBに確実に存在するもののみを取得するので強制アンラップを許容
        // swiftlint:disable:next force_unwrapping
        return analysisList![0]
    }

    // 特定の何故何故分析を削除
    internal func deleteWhywhyAnalytics(_ whywhyAnalysisNo: Int) {
        // Realmデータベースを取得
        do {
            let realm = try Realm()
            let analysis = realm.objects(Analysis.self).filter("whywhyAnalysisNo == %@", whywhyAnalysisNo).first
            if  let analysis = analysis {
                try realm.write {
                    realm.delete(analysis)
                }
            }
        } catch {
            // TODO: 後ほどエラー処理を実装
        }
    }
}
