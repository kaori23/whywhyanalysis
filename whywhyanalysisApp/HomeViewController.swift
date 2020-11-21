//
//  HomeViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/14.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var itemList: Results<Whywhyanalysis>!
    let cellHeigh:CGFloat = 125
    
    // 画面が表示される直前にtableViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeigh
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Realmからデータを取得
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        let realm = try! Realm(configuration: config)
        //            let realm = try Realm()
        itemList = realm.objects(Whywhyanalysis.self)
        
        // tableViewにカスタムセルを登録
        tableView.register(UINib(nibName: "analysisListCustumCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! analysisListCustumCell
        // カスタムセル内のプロパティ設定
        
        let row = itemList.count - indexPath.row - 1
        if(cell.measuresLabel.text != nil ) {
            cell.measuresLabel.text = "問題：\(itemList[row].problem)"
            
        } else {
            cell.measuresLabel.text = "取得失敗したよ"
        }
        
        if(cell.problemLabel.text != nil) {
            cell.problemLabel.text = "対策：\(itemList[indexPath.row].measures)"
        } else {
            cell.problemLabel.text = "取得失敗したよ"
        }
        return cell
    }
}
