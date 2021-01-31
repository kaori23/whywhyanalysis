//
//  analysisListCustumCell.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class AnalysisListCustumCell: UITableViewCell {
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var statusLabel: UILabel!

    override internal func awakeFromNib() {
        super.awakeFromNib()
        // レイアウト設定
        let backgroundColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)
        statusLabel.backgroundColor = backgroundColor
        statusLabel.textColor = .white
        statusLabel.textAlignment = NSTextAlignment.center
    }

    override internal func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
