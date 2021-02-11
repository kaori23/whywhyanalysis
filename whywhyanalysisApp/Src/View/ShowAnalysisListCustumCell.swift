//
//  analysisListCustumCell.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class ShowAnalysisListCustumCell: UITableViewCell {
    internal let status = ""
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var statusButton: UIButton!

    override internal func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override internal func awakeFromNib() {
        super.awakeFromNib()
        // レイアウト設定
        let btnBgColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)
        statusButton.backgroundColor = btnBgColor
        statusButton.setTitleColor(.white, for: .normal)
    }
}
