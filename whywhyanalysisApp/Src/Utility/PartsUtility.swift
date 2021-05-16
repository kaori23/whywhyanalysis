//
//  PartsUtility.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2021/05/02.
//  Copyright © 2021 長塚かおり. All rights reserved.
//

import Foundation
import SwiftMessages

internal enum PartsUtility {
    internal static func createAlert(alertType: String, alertTitle: String, alertBody: String) {
        let view = MessageView.viewFromNib(layout: .messageView)
        switch alertType {
        case "error":
            view.configureTheme(.error)
        case "success":
            view.configureTheme(.success)

        default:
            break
        }
        view.configureDropShadow()
        view.configureContent(title: alertTitle, body: alertBody)
        view.button?.isHidden = true
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        SwiftMessages.show(view: view)
    }
}
