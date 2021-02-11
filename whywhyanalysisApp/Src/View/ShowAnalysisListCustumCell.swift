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
    internal let appColor = AppColor()
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var problemLabel: UILabel!
    @IBOutlet internal weak var statusButton: UIButton!

    override internal func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override internal func awakeFromNib() {
        super.awakeFromNib()
        // レイアウト設定
        statusButton.backgroundColor = appColor.btnBgColor
        statusButton.setTitleColor(.white, for: .normal)
    }
}
