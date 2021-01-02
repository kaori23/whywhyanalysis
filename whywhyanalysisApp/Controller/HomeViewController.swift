//
//  HomeViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/14.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var whywhyAnalysisList: Array<WhywhyAnalysis> = []
    let cellHeigh:CGFloat = 100
    
    // 画面が表示される直前にtableViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = DataStorage()
        whywhyAnalysisList = data.loadAllWhyAnalyticsData()
        tableView.reloadData()
    }
    
    //セルの編集を許可する
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //スワイプしたセルを削除　
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = whywhyAnalysisList.count - indexPath.row - 1
        let whywhyAnalysisNo = whywhyAnalysisList[row].whywhyAnalysisNo
        //ここでDB処理を追加
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //ここでDB処理を追加
            let data = DataStorage()
            data.deleteWhywhyAnalytics(whywhyAnalysisNo)
            whywhyAnalysisList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除する"
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
        
        // レイアウト設定
        let viewBgColor = UIColor(red: 100/255, green: 249/255, blue: 255/255, alpha: 1)
        let borderColor = UIColor(red: 139/255, green: 222/255, blue: 255/255, alpha: 1)
        tableView.separatorColor = viewBgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = borderColor.cgColor
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whywhyAnalysisList.count
    }
    
    // セルをタップした場合、何故何故分析詳細画面に遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = whywhyAnalysisList.count - indexPath.row - 1
        let whywhyAnalysis = whywhyAnalysisList[row]
        let nextViewController = R.storyboard.main.detailWhyWhyAnalysis()
        if nextViewController != nil {
            nextViewController!.whywhyAnalysis = whywhyAnalysis
            nextViewController!.mode = "編集"
            navigationController?.pushViewController(nextViewController!, animated: true)
        } else {
            // TODO: 後ほどエラー処理を実装
            print("画面遷移失敗")
        }
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! AnalysisListCustumCell
        
        let row = whywhyAnalysisList.count - indexPath.row - 1
        if(cell.measuresLabel.text != nil ) {
            cell.measuresLabel.text = "問題：\(whywhyAnalysisList[row].problem!)"
            
        } else {
            // TODO: 後ほどエラー処理を実装
            cell.measuresLabel.text = "取得失敗したよ"
        }
        
        if(cell.problemLabel.text != nil) {
            cell.problemLabel.text = "対策：\(whywhyAnalysisList[row].measures!)"
        } else {
            // TODO: 後ほどエラー処理を実装
            cell.problemLabel.text = "取得失敗したよ"
        }
        
        if(cell.statusLabel.text != nil) {
            cell.statusLabel.text = whywhyAnalysisList[row].status!
        }
        
        return cell
    }
    
    @IBAction func addAnalysisClick(_ sender: Any) {
        let nextViewController = R.storyboard.main.detailWhyWhyAnalysis()
        if nextViewController != nil {
            nextViewController!.mode = "新規作成"
            navigationController?.pushViewController(nextViewController!, animated: true)
        } else {
            // TODO: 後ほどエラー処理を実装
            print("画面遷移失敗")
        }
    }
}
