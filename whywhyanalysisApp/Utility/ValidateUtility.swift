//
//  ValidateUtility.swift
//  whywhyanalysisApp
//
//  Created by 長塚かおり on 2020/11/21.
//  Copyright © 2020 長塚かおり. All rights reserved.
//

import Foundation

class ValidateUtility {
        
    //Sting?型の空文字チェック
    static func textEmplyCheck(optinalText: String?) -> Bool {
        var flag = false
        if let optinalText = optinalText {
            // 空白文字を削除
            let text = optinalText.trimmingCharacters(in: .whitespacesAndNewlines)
            flag = text.isEmpty
        }
        return flag
    }
}
