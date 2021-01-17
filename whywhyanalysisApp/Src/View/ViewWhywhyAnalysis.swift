//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class ViewWhywhyAnalysis: UIView {
    @IBOutlet internal weak var problemTextField: UITextField!
    @IBOutlet internal weak var oneWhyTextFiled: UITextField!
    @IBOutlet internal weak var twoWhyTextField: UITextField!
    @IBOutlet internal weak var threeWhyTextField: UITextField!
    @IBOutlet internal weak var fourWhyTextField: UITextField!
    @IBOutlet internal weak var fiveWhyTextField: UITextField!
    @IBOutlet internal weak var measuresTextField: UITextField!
    internal var whywhyAnalysis: WhywhyAnalysis!
    internal var mode = ""
    @IBOutlet internal weak var analysisView: UIView!
    @IBOutlet internal weak var measuresLabel: UILabel!
    @IBOutlet internal weak var confirmButton: UIButton!

    override internal func awakeFromNib() {
        super.awakeFromNib()

        let viewBgColor = UIColor(red: 243 / 255, green: 250 / 255, blue: 253 / 255, alpha: 1)
        let labelBgColor = UIColor(red: 145 / 255, green: 222 / 255, blue: 252 / 255, alpha: 1)
        let buttonBgColor = UIColor(red: 113 / 255, green: 205 / 255, blue: 255 / 255, alpha: 1)

        analysisView.backgroundColor = viewBgColor
        measuresLabel.backgroundColor = labelBgColor
        measuresLabel.textColor = .white
        confirmButton.backgroundColor = buttonBgColor
        confirmButton.tintColor = .white
    }
}
