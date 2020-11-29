//
//  HomeViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/14.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var whywhyAnalysisList: Array<WhywhyAnalysis> = []
    let cellHeigh:CGFloat = 125
    
    // 画面が表示される直前にtableViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = DataStorage()
        whywhyAnalysisList = data.loadAllWhyAnalyticsData()
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
        
        // Realmからデータを全件取得
        let data = DataStorage()
        whywhyAnalysisList = data.loadAllWhyAnalyticsData()
        
        
        // tableViewにカスタムセルを登録
        tableView.register(UINib(nibName: "AnalysisListCustumCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whywhyAnalysisList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! AnalysisListCustumCell
        
        let row = whywhyAnalysisList.count - indexPath.row - 1
        if(cell.measuresLabel.text != nil ) {
            cell.measuresLabel.text = "問題：\(whywhyAnalysisList[row].problem!)"
            
        } else {
            cell.measuresLabel.text = "取得失敗したよ"
        }
        
        if(cell.problemLabel.text != nil) {
            cell.problemLabel.text = "対策：\(whywhyAnalysisList[row].measures!)"
        } else {
            cell.problemLabel.text = "取得失敗したよ"
        }
        return cell
    }
}
