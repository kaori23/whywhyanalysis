//
//  HomeViewController.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/14.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit
internal class ShowAnalysisListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    internal var whywhyAnalysisList: [Analysis] = []
    internal let cellHeigh: CGFloat = 130
    @IBOutlet internal weak var tableView: UITableView!
    @IBOutlet internal weak var titleLabel: UILabel!
    @IBOutlet internal weak var backgroundView: UIView!

    // 画面が表示される直前にtableViewを更新
    override internal func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = DataStorage()
        whywhyAnalysisList = data.loadAllWhyAnalyticsData()
        tableView.reloadData()
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Realmからデータを全件取得
        let data = DataStorage()
        whywhyAnalysisList = data.loadAllWhyAnalyticsData()
        // tableViewにカスタムセルを登録
        tableView.register(UINib(nibName: "ShowAnalysisListCustumCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()

        // レイアウト設定
        backgroundView.backgroundColor = AppColor.viewBgColor
        tableView.backgroundColor = UIColor.white
        titleLabel.textColor = UIColor.black
        titleLabel.layer.borderColor = UIColor.link.cgColor
        tableView.separatorColor = AppColor.tableBgColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        titleLabel.layer.borderWidth = 1
    }

    @IBAction private func addAnalysisClick(_ sender: Any) {
        let nextViewController = R.storyboard.main.detailWhyWhyAnalysis()
        if let nextVC = nextViewController {
            nextVC.mode = .new
            navigationController?.pushViewController(nextVC, animated: true)
        } else {
            // TODO: 後ほどエラー処理を実装
            print("画面遷移失敗")
        }
    }

    // セルの編集を許可する
    internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    // スワイプしたセルを削除
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = whywhyAnalysisList.count - indexPath.row - 1
        let whywhyAnalysisNo = whywhyAnalysisList[row].whywhyAnalysisNo
        // ここでDB処理を追加
        if editingStyle == UITableViewCell.EditingStyle.delete {
            // ここでDB処理を追加
            let data = DataStorage()
            data.deleteWhywhyAnalytics(whywhyAnalysisNo)
            whywhyAnalysisList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            whywhyAnalysisList = data.loadAllWhyAnalyticsData()
        }
    }

    internal func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "削除する"
    }

    // セルの高さを設定
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeigh
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        whywhyAnalysisList.count
    }

    // セルをタップした場合、何故何故分析詳細画面に遷移する
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = whywhyAnalysisList.count - indexPath.row - 1
        let whywhyAnalysis = whywhyAnalysisList[row]
        let nextViewController = R.storyboard.main.detailWhyWhyAnalysis()
        if let nextVC = nextViewController {
            nextVC.whywhyAnalysis = whywhyAnalysis
            nextVC.mode = .edit
            navigationController?.pushViewController(nextVC, animated: true)
        } else {
            // TODO: 後ほどエラー処理を実装
            print("画面遷移失敗")
        }
       }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? ShowAnalysisListCustumCell
        let row = whywhyAnalysisList.count - indexPath.row - 1
        if let cell = cell {
            if  let problem = whywhyAnalysisList[row].problem {
                cell.problemLabel.text = "問題：" + problem
            } else {
                // TODO: 後ほどエラー処理を実装
            }
            if let measure = whywhyAnalysisList[row].measures {
                cell.measuresLabel.text = "対策：" + measure
            } else {
                // TODO: 後ほどエラー処理を実装
            }

            if let status = whywhyAnalysisList[row].status {
                cell.statusButton.setTitle(status, for: .normal)
            }
            let cellBackgroundView = UIView()
            cellBackgroundView.backgroundColor = UIColor.gray
            cell.selectedBackgroundView = cellBackgroundView
            cell.statusButton.tag = row
            cell.statusButton.addTarget(self, action: #selector(self.buttonEvent(_: )), for: UIControl.Event.touchUpInside)
        }
        // cellは必ず値が入る為強制アンラップを許容
        // swiftlint:disable:next force_unwrapping
        return cell!
    }

    @objc
    internal func buttonEvent(_ sender: UIButton) {
        let whywhyAnalysis = whywhyAnalysisList[sender.tag]
        let nextViewController = R.storyboard.main.changeStatus()
        if let nextVC = nextViewController {
            nextVC.whywhyAnalysis = whywhyAnalysis
            navigationController?.pushViewController(nextVC, animated: true)
        } else {
            // TODO: 後ほどエラー処理を実装
            print("画面遷移失敗")
        }
    }
}
