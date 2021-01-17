//
//  analysisListCustumCell.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class AnalysisListCustumCell: UITableViewCell {
    @IBOutlet weak internal var measuresLabel: UILabel!
    @IBOutlet weak internal var problemLabel: UILabel!
    @IBOutlet weak internal var statusLabel: UILabel!
    internal override func awakeFromNib() {
        super.awakeFromNib()
        // レイアウト設定
        let backgroundColor = UIColor(red: 113/255, green: 205/255, blue: 255/255, alpha: 1)
        statusLabel.backgroundColor = backgroundColor
        statusLabel.textColor = .white
        statusLabel.textAlignment = NSTextAlignment.center
    }

    internal override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
