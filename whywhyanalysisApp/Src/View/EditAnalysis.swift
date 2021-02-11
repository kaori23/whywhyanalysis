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
    internal let whyLabelTextColor = UIColor(red: 17 / 255, green: 188 / 255, blue: 255 / 255, alpha: 1)
    internal let whyLabelBgColor = UIColor(red: 50 / 255, green: 200 / 255, blue: 252 / 255, alpha: 0.05)
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

    override internal func awakeFromNib() {
        super.awakeFromNib()

        let viewBgColor = UIColor(red: 243 / 255, green: 250 / 255, blue: 253 / 255, alpha: 1)
        let headingLabelBgColor = UIColor(red: 145 / 255, green: 222 / 255, blue: 252 / 255, alpha: 1)
        let btnBgColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)

        oneWHYLabel.textColor = whyLabelTextColor
        oneWHYLabel.backgroundColor = whyLabelBgColor
        twoWHYLabel.textColor = whyLabelTextColor
        twoWHYLabel.backgroundColor = whyLabelBgColor
        threeWHYLabel.textColor = whyLabelTextColor
        threeWHYLabel.backgroundColor = whyLabelBgColor
        fourWHYLabel.textColor = whyLabelTextColor
        fourWHYLabel.backgroundColor = whyLabelBgColor
        fiveWHYLabel.textColor = whyLabelTextColor
        fiveWHYLabel.backgroundColor = whyLabelBgColor

        analysisView.backgroundColor = viewBgColor
        measuresLabel.backgroundColor = headingLabelBgColor
        measuresLabel.textColor = .white
        confirmButton.backgroundColor = btnBgColor
        confirmButton.tintColor = .white
    }
}
