//
//  Ruleset.swift
//  Emojione
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

public class Ruleset: RulesetInterface {
    
    private let shortcodeReplace: [String : String] = [
        ":joy:": "\u{1f602}",
        ":dog:": "\u{1F436}"
    ]
    
    
    /// Returns the shortcode unicode replacement rules
    
    /**
     Returns the shortcode unicode replacement rules
     */
    
    public func getShortcodeReplace() -> [String : String] {
        return shortcodeReplace
    }
    
    
    /// Returns the ascii unicode replacement rules
    
    /**
     Returns the ascii unicode replacement rules
     */
    
    public func getAsciiReplace() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the unicode shortcode replacement rules
    
    /**
     Returns the unicode shortcode replacement rules
     */
    
    public func getUnicodeReplace() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the unicode shortcode greedy replacement rules
    
    /**
     Returns the unicode shortcode greedy replacement rules
     */
    
    public func getUnicodeReplaceGreedy() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the regexp to find ascii smilies
    
    /**
     Returns the regexp to find ascii smilies
     */
    
    public func getAsciiRegexp() -> [String : String] {
        return [:]
    }
}
