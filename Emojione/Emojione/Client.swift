//
//  Client.swift
//  Emojione
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

public class Client: ClientInterface {
    
    public var shortcodeRegexp: String = ":([-+\\w]+):"
    
    
    /// First pass changes unicode characters into emoji markup.
    /// Second pass changes any shortnames into emoji markup.
    
    /**
     First pass changes unicode characters into emoji markup.
     Second pass changes any shortnames into emoji markup.
     */
    
    public func toImage(string: String) -> String {
        return ""
    }
    
    
    /// Uses toShort to transform all unicode into a standard shortname
    /// then transforms the shortname into unicode.
    /// This is done for standardization when converting several unicode types.
    
    /**
     Uses toShort to transform all unicode into a standard shortname
     then transforms the shortname into unicode.
     This is done for standardization when converting several unicode types.
     */
    
    public func unifyUnicode(string: String) -> String {
        return ""
    }
    
    
    /// This will output unicode from shortname input.
    /// If Client/$ascii is true it will also output unicode from ascii.
    /// This is useful for sending emojis back to mobile devices.
    
    /**
     This will output unicode from shortname input.
     If Client/$ascii is true it will also output unicode from ascii.
     This is useful for sending emojis back to mobile devices.
     */
    
    public func shortnameToUnicode(string: String) -> String {
        
    }
    
    
    /// This will replace shortnames with their ascii equivalent.
    /// ex. :wink: --> ;^)
    /// This is useful for systems that don't support unicode or images.
    
    /**
     This will replace shortnames with their ascii equivalent.
     ex. :wink: --> ;^)
     This is useful for systems that don't support unicode or images.
     */
    
    public func shortnameToAscii(string: String) -> String {
        return ""
    }
    
    
    /// This will output image markup from shortname input.
    
    /**
     This will output image markup from shortname input.
     */
    
    public func shortnameToImage(string: String) -> String {
        return ""
    }
    
    
    /// This will return the shortname from unicode input.
    
    /**
     This will return the shortname from unicode input.
     */
    
    public func toShort(string: String) -> String {
        return ""
    }
    
    
    /// This will output image markup from unicode input.
    
    /**
     This will output image markup from unicode input.
     */
    
    public func unicodeToImage(string: String) -> String {
        return ""
    }
    
    
    // MARK: - Helper Methods
    
    private func regexMatches(regexString: String, string: String) -> [(String, NSTextCheckingResult)] {
        let regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: regexString, options: [])
        } catch {
            return []
        }
        
        let matches = regex.matches(in: string, options: [], range: NSRange(string.startIndex..., in: string))
        
        var result: [(String, NSTextCheckingResult)] = []
        
        for match: NSTextCheckingResult in matches {
            let range = match.range
            if let swiftRange = Range(range, in: string) {
                let matchedString = String(string[swiftRange])
                result.append((matchedString, match))
            }
        }
        
        return result
    }
}
