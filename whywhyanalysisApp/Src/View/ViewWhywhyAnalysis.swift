//
//  ViewWhywhyAnalysis.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/12/12.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import UIKit

class ViewWhywhyAnalysis: UIView {
    @IBOutlet weak var problemTextField: UITextField!
    @IBOutlet weak var oneWhyTextFiled: UITextField!
    @IBOutlet weak var twoWhyTextField: UITextField!
    @IBOutlet weak var threeWhyTextField: UITextField!
    @IBOutlet weak var fourWhyTextField: UITextField!
    @IBOutlet weak var fiveWhyTextField: UITextField!
    @IBOutlet weak var measuresTextField: UITextField!
    var whywhyAnalysis: WhywhyAnalysis!
    var mode = ""
    @IBOutlet weak var analysisView: UIView!
    @IBOutlet weak var measuresLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!

    override func awakeFromNib() {
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
