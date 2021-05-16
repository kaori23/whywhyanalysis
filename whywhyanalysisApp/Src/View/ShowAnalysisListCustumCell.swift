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
    @IBOutlet internal weak var problemLabelUnderline: UIView!
    @IBOutlet internal weak var deadlineLabelUnderline: UIView!

    override internal func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override internal func awakeFromNib() {
        super.awakeFromNib()
        // レイアウト設定
        self.backgroundColor = UIColor.white
        statusButton.backgroundColor = AppColor.btnBgColor
        measuresLabel.layer.borderWidth = 0.7
        measuresLabel.layer.borderColor = AppColor.mainColor.cgColor
        problemLabelUnderline.backgroundColor = AppColor.mainColor
        deadlineLabelUnderline.backgroundColor = AppColor.mainColor
        statusButton.setTitleColor(.white, for: .normal)
    }
}
