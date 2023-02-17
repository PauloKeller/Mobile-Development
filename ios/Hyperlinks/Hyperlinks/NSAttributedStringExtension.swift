//
//  NSAttributedStringExtension.swift
//  Hyperlinks
//
//  Created by paulo on 19/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    static func makeHyperlink(for path:String, in string:String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let subStringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: subStringRange)
        
        return attributedString
    }
    
}
