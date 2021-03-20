//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class EditAnalysis: UIView, UITextFieldDelegate, UIScrollViewDelegate {
    internal var whywhyAnalysis: Analysis?
    internal var mode: AnalysisDivision?
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

        oneWHYLabel.textColor = AppColor.whyLabelTextColor
        oneWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        twoWHYLabel.textColor = AppColor.whyLabelTextColor
        twoWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        threeWHYLabel.textColor = AppColor.whyLabelTextColor
        threeWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        fourWHYLabel.textColor = AppColor.whyLabelTextColor
        fourWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        fiveWHYLabel.textColor = AppColor.whyLabelTextColor
        fiveWHYLabel.backgroundColor = AppColor
            .whyLabelBgColor

        oneArrow.tintColor = AppColor.mainColor
        twoArrow.tintColor = AppColor.mainColor
        threeArrow.tintColor = AppColor.mainColor
        fourArrow.tintColor = AppColor.mainColor
        fiveArrow.tintColor = AppColor.mainColor

        analysisView.backgroundColor = AppColor.viewBgColor
        measuresLabel.backgroundColor = AppColor.headingLabelBgColor
        measuresLabel.textColor = .white
        confirmButton.backgroundColor = AppColor.btnBgColor
        confirmButton.tintColor = .white
    }
}
