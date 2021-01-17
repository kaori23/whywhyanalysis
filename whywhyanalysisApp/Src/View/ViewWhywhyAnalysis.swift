//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

internal class ViewWhywhyAnalysis: UIView {
    @IBOutlet weak internal var problemTextField: UITextField!
    @IBOutlet weak internal var oneWhyTextFiled: UITextField!
    @IBOutlet weak internal var twoWhyTextField: UITextField!
    @IBOutlet weak internal var threeWhyTextField: UITextField!
    @IBOutlet weak internal var fourWhyTextField: UITextField!
    @IBOutlet weak internal var fiveWhyTextField: UITextField!
    @IBOutlet weak internal var measuresTextField: UITextField!
    internal var whywhyAnalysis: WhywhyAnalysis!
    internal var mode = ""
    @IBOutlet weak internal var analysisView: UIView!
    @IBOutlet weak internal var measuresLabel: UILabel!
    @IBOutlet weak internal var confirmButton: UIButton!

    internal override func awakeFromNib() {
        super.awakeFromNib()

        let viewBgColor = UIColor(red: 243/255, green: 250/255, blue: 253/255, alpha: 1)
        let labelBgColor = UIColor(red: 145/255, green: 222/255, blue: 252/255, alpha: 1)
        let buttonBgColor = UIColor(red: 113/255, green: 205/255, blue: 255/255, alpha: 1)

        analysisView.backgroundColor = viewBgColor
        measuresLabel.backgroundColor = labelBgColor
        measuresLabel.textColor = .white
        confirmButton.backgroundColor = buttonBgColor
        confirmButton.tintColor = .white
    }
}
