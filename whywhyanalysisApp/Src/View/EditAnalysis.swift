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

    @IBOutlet internal weak var measuresView: UIView!
    @IBOutlet internal weak var confirmView: UIView!
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

    @IBOutlet internal weak var problemView: UIView!
    @IBOutlet internal weak var oneAnalysisView: UIView!
    @IBOutlet internal weak var twoAnalysisView: UIView!
    @IBOutlet internal weak var threeAnalysisView: UIView!
    @IBOutlet internal weak var fourAnalysisView: UIView!
    @IBOutlet internal weak var fiveAnalysisView: UIView!

    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var confirmButton: UIButton!
    @IBOutlet internal weak var oneArrow: UIImageView!
    @IBOutlet internal weak var twoArrow: UIImageView!
    @IBOutlet internal weak var threeArrow: UIImageView!
    @IBOutlet internal weak var fourArrow: UIImageView!
    @IBOutlet internal weak var fiveArrow: UIImageView!

    override internal func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = UIColor.white
        measuresView.layer.backgroundColor = UIColor.white.cgColor
        confirmView.layer.backgroundColor =
            UIColor.white.cgColor

        problemTextField.backgroundColor =
            UIColor.white
        problemTextField.textColor = UIColor.black

        oneWHYLabel.textColor = AppColor.whyLabelTextColor
        oneWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        oneWhyTextFiled.textColor = UIColor.black
        oneWhyTextFiled.backgroundColor = UIColor.white

        twoWHYLabel.textColor = AppColor.whyLabelTextColor
        twoWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        twoWhyTextField.textColor = UIColor.black
        twoWhyTextField.backgroundColor = UIColor.white

        threeWHYLabel.textColor = AppColor.whyLabelTextColor
        threeWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        threeWhyTextField.textColor = UIColor.black
        threeWhyTextField.backgroundColor = UIColor.white

        fourWHYLabel.textColor = AppColor.whyLabelTextColor
        fourWHYLabel.backgroundColor = AppColor.whyLabelBgColor
        fourWhyTextField.textColor = UIColor.black
        fourWhyTextField.backgroundColor = UIColor.white

        fiveWHYLabel.textColor = AppColor.whyLabelTextColor
        fiveWHYLabel.backgroundColor = AppColor
            .whyLabelBgColor
        fiveWhyTextField.textColor = UIColor.black
        fiveWhyTextField.backgroundColor = UIColor.white

        oneArrow.tintColor = AppColor.mainColor
        twoArrow.tintColor = AppColor.mainColor
        threeArrow.tintColor = AppColor.mainColor
        fourArrow.tintColor = AppColor.mainColor
        fiveArrow.tintColor = AppColor.mainColor

        problemView.backgroundColor = AppColor.viewBgColor
        oneAnalysisView.backgroundColor = AppColor.viewBgColor
        twoAnalysisView.backgroundColor = AppColor.viewBgColor
        threeAnalysisView.backgroundColor = AppColor.viewBgColor
        fourAnalysisView.backgroundColor = AppColor.viewBgColor
        fiveAnalysisView.backgroundColor = AppColor.viewBgColor

        measuresLabel.textColor = .white
        measuresLabel.backgroundColor = AppColor.headingLabelBgColor
        measuresTextField.textColor = UIColor.black
        measuresTextField.backgroundColor = UIColor.white

        confirmButton.tintColor = .white
        confirmButton.backgroundColor = AppColor.btnBgColor
    }
}
