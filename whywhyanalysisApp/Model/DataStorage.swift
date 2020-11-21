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
        var itemList: Results<Whywhyanalysis>!
    
    // 全項目全件取得
    func loadAllData() -> Array<Whywhyanalysis> {
        // データベースからデータを取得
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        let realm = try! Realm(configuration: config)
         itemList = realm.objects(Whywhyanalysis.self)
        return Array(itemList)
    }
    
    // 新規何故何故分析を追加
    func createData(_ analysis:Whywhyanalysis) {
        // Realmデータベースを取得
        let realm = try! Realm()
        // データベースに追加
        try! realm.write {
            realm.add(analysis)
        }
    }
    
}
