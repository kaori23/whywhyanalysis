//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class EditAnalysis: UIView {
    internal var whywhyAnalysis: Analysis?
    internal var mode = ""
    internal let appColor = AppColor()
    @IBOutlet internal weak var oneWHYLabel: UILabel!
    @IBOutlet internal weak var twoWHYLabel: UILabel!
    @IBOutlet internal weak var threeWHYLabel: UILabel!
    @IBOutlet internal weak var fourWHYLabel: UILabel!
    @IBOutlet internal weak var fiveWHYLabel: UILabel!
    @IBOutlet internal weak var problemTextField: UITextField!
    @IBOutlet internal weak var oneWhyTextFiled: UITextField!
    @IBOutlet internal weak var twoWhyTextField: UITextField!
    @IBOutlet internal weak var threeWhyTextField: UITextField!
    @IBOutlet internal weak var fourWhyTextField: UITextField!
    @IBOutlet internal weak var fiveWhyTextField: UITextField!
    @IBOutlet internal weak var measuresTextField: UITextField!
    @IBOutlet internal weak var analysisView: UIView!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var confirmButton: UIButton!
    @IBOutlet internal weak var oneArrow: UIImageView!
    @IBOutlet internal weak var twoArrow: UIImageView!
    @IBOutlet internal weak var threeArrow: UIImageView!
    @IBOutlet internal weak var fourArrow: UIImageView!
    @IBOutlet internal weak var fiveArrow: UIImageView!

    override internal func awakeFromNib() {
        super.awakeFromNib()

        oneWHYLabel.textColor = appColor.whyLabelTextColor
        oneWHYLabel.backgroundColor = appColor.whyLabelBgColor
        twoWHYLabel.textColor = appColor.whyLabelTextColor
        twoWHYLabel.backgroundColor = appColor.whyLabelBgColor
        threeWHYLabel.textColor = appColor.whyLabelTextColor
        threeWHYLabel.backgroundColor = appColor.whyLabelBgColor
        fourWHYLabel.textColor = appColor.whyLabelTextColor
        fourWHYLabel.backgroundColor = appColor.whyLabelBgColor
        fiveWHYLabel.textColor = appColor.whyLabelTextColor
        fiveWHYLabel.backgroundColor = appColor
            .whyLabelBgColor

        oneArrow.tintColor = appColor.mainColor
        twoArrow.tintColor = appColor.mainColor
        threeArrow.tintColor = appColor.mainColor
        fourArrow.tintColor = appColor.mainColor
        fiveArrow.tintColor = appColor.mainColor

        analysisView.backgroundColor = appColor.viewBgColor
        measuresLabel.backgroundColor = appColor.headingLabelBgColor
        measuresLabel.textColor = .white
        confirmButton.backgroundColor = appColor.btnBgColor
        confirmButton.tintColor = .white
    }
}
