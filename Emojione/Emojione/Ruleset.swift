//
//  Ruleset.swift
//  Emojione
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

class Ruleset: RulesetInterface {
    
    /// Returns the shortcode unicode replacement rules
    
    /**
     Returns the shortcode unicode replacement rules
     */
    
    func getShortcodeReplace() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the ascii unicode replacement rules
    
    /**
     Returns the ascii unicode replacement rules
     */
    
    func getAsciiReplace() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the unicode shortcode replacement rules
    
    /**
     Returns the unicode shortcode replacement rules
     */
    
    func getUnicodeReplace() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the unicode shortcode greedy replacement rules
    
    /**
     Returns the unicode shortcode greedy replacement rules
     */
    
    func getUnicodeReplaceGreedy() -> [String : String] {
        return [:]
    }
    
    
    /// Returns the regexp to find ascii smilies
    
    /**
     Returns the regexp to find ascii smilies
     */
    
    func getAsciiRegexp() -> [String : String] {
        return [:]
    }
}
