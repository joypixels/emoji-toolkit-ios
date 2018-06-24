//
//  Client.swift
//  Emojione
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

public class Client: ClientInterface {
    
    public var ascii: Bool = false // convert ascii smileys?
    public var shortcodes: Bool = true // convert shortcodes?
    
    public var emojiVersion: String = "3.1"
    public var emojiSize: String = "32" //available sizes are '32', '64', and '128'
    
    public var spriteSize: String = "32" // available sizes are '32' and '64'
    public var imagePathPNG = "https://cdn.jsdelivr.net/emojione/assets"
    
    public var shortcodeRegEx: String = ":([-+\\w]+):"
    public var unicodeRegEx: String = "(?:\u{1F3F3}\u{FE0F}?\u{200D}?\u{1F308}|\u{1F441}\u{FE0F}?\u{200D}?\u{1F5E8}\u{FE0F}?)|[\u{0023}-\u{0039}]\u{FE0F}?\u{20e3}|(?:\u{1F3F4}[\u{E0060}-\u{E00FF}]{1,6})|[\u{1F1E0}-\u{1F1FF}]{2}|(?:[\u{1F468}\u{1F469}])\u{FE0F}?[\u{1F3FA}-\u{1F3FF}]?\u{200D}?(?:[\u{2695}\u{2696}\u{2708}\u{1F4BB}\u{1F4BC}\u{1F527}\u{1F52C}\u{1F680}\u{1F692}\u{1F33E}-\u{1F3ED}])|[\u{1F468}-\u{1F469}\u{1F9D0}-\u{1F9DF}][\u{1F3FA}-\u{1F3FF}]?\u{200D}?[\u{2640}\u{2642}\u{2695}\u{2696}\u{2708}]?\u{FE0F}?|(?:[\u{2764}\u{1F466}-\u{1F469}\u{1F48B}][\u{200D}\u{FE0F}]{0,2})|[\u{2764}\u{1F466}-\u{1F469}\u{1F48B}]|(?:[\u{2764}\u{1F466}-\u{1F469}\u{1F48B}]\u{FE0F}?)|(?:[\u{1f46e}\u{1F468}\u{1F469}\u{1f575}\u{1f471}-\u{1f487}\u{1F645}-\u{1F64E}\u{1F926}\u{1F937}]|[\u{1F460}-\u{1F482}\u{1F3C3}-\u{1F3CC}\u{26F9}\u{1F486}\u{1F487}\u{1F6A3}-\u{1F6B6}\u{1F938}-\u{1F93E}]|\u{1F46F})\u{FE0F}?[\u{1F3FA}-\u{1F3FF}]?\u{200D}?[\u{2640}\u{2642}]?\u{FE0F}?|(?:[\u{26F9}\u{261D}\u{270A}-\u{270D}\u{1F385}-\u{1F3CC}\u{1F442}-\u{1F4AA}\u{1F574}-\u{1F596}\u{1F645}-\u{1F64F}\u{1F6A3}-\u{1F6CC}\u{1F918}-\u{1F93E}]\u{FE0F}?[\u{1F3FA}-\u{1F3FF}])|(?:[\u{2194}-\u{2199}\u{21a9}-\u{21aa}]\u{FE0F}?|[\u{0023}-\u{002a}]|[\u{3030}\u{303d}]\u{FE0F}?|(?:[\u{1F170}-\u{1F171}]|[\u{1F17E}-\u{1F17F}]|\u{1F18E}|[\u{1F191}-\u{1F19A}]|[\u{1F1E6}-\u{1F1FF}])\u{FE0F}?|\u{24c2}\u{FE0F}?|[\u{3297}\u{3299}]\u{FE0F}?|(?:[\u{1F201}-\u{1F202}]|\u{1F21A}|\u{1F22F}|[\u{1F232}-\u{1F23A}]|[\u{1F250}-\u{1F251}])\u{FE0F}?|[\u{203c}\u{2049}]\u{FE0F}?|[\u{25aa}-\u{25ab}\u{25b6}\u{25c0}\u{25fb}-\u{25fe}]\u{FE0F}?|[\u{00a9}\u{00ae}]\u{FE0F}?|[\u{2122}\u{2139}]\u{FE0F}?|\u{1F004}\u{FE0F}?|[\u{2b05}-\u{2b07}\u{2b1b}-\u{2b1c}\u{2b50}\u{2b55}]\u{FE0F}?|[\u{231a}-\u{231b}\u{2328}\u{23cf}\u{23e9}-\u{23f3}\u{23f8}-\u{23fa}]\u{FE0F}?|\u{1F0CF}|[\u{2934}\u{2935}]\u{FE0F}?)|[\u{2700}-\u{27bf}]\u{FE0F}?|[\u{1F000}-\u{1F6FF}\u{1F900}-\u{1F9FF}]\u{FE0F}?|[\u{2600}-\u{26ff}]\u{FE0F}?|[\u{0030}-\u{0039}]\u{FE0F}"
    
    
    public var ruleset: RulesetInterface = Ruleset()
    
    
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
        guard shortcodes == true else { return string }
        var result = string
        
        if ascii {
            result = asciiToShortname(string: result)
        }

        return regexReplace(regexString: shortcodeRegEx, string: result) { shortcode -> String in
            return ruleset.getShortcodeReplace()[shortcode] ?? shortcode
        }
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
    
    
    /// This will replace ascii with their shortname equivalent
    /// ex. :) --> :slight_smile:
    /// This is useful for systems that don't ascii emoji.
    
    /**
     This will replace ascii with their shortname equivalent
     ex. :) --> :slight_smile:
     This is useful for systems that don't ascii emoji.
     */
    
    public func asciiToShortname(string: String) -> String {
        return regexReplace(regexString: ruleset.getAsciiRegexp(), string: string) { ascii -> String in
            return ruleset.getAsciiReplace()[ascii] ?? ascii
        }
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
        return regexReplace(regexString: unicodeRegEx, string: string) { emoji -> String in
            return ruleset.getUnicodeReplace()[emoji] ?? emoji
        }
    }
    
    
    /// This will output image markup from unicode input.
    
    /**
     This will output image markup from unicode input.
     */
    
    public func unicodeToImage(string: String, font: UIFont) -> NSAttributedString {
        return regexImageReplace(regexString: unicodeRegEx, string: string, font: font) { emoji -> UIImage? in
            let filename = unicodeToScalarString(emoji: emoji)
            return getEmojiImage(filename: filename)
        }
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
    
    
    private func regexReplace(regexString: String, string: String, callback: (String) -> String) -> String {
        let mutableString = NSMutableString(string: string)
        var offset = 0
        
        let matches = regexMatches(regexString: regexString, string: string)
        
        for (matchString, match) in matches {
            let replacementString = callback(matchString)
            var resultRange = match.range
            resultRange.location += offset
            
            mutableString.replaceCharacters(in: resultRange, with: replacementString)
            
            offset += replacementString.utf16.count - resultRange.length
        }
        
        return mutableString as String
    }
    
    
    private func regexImageReplace(regexString: String, string: String, font: UIFont, callback: (String) -> UIImage?) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(string: string)
        var offset = 0
        
        let matches = regexMatches(regexString: regexString, string: string)
        
        for (matchString, match) in matches {
            var resultRange = match.range
            resultRange.location += offset
            
            guard let image = callback(matchString) else { continue }
            
            let attrStringWithImage = buildAttributedStringWithTextAttachment(image: image, font: font)
            
            mutableString.replaceCharacters(in: resultRange, with: attrStringWithImage)
            
            offset += attrStringWithImage.length - resultRange.length
        }
        
        return mutableString as NSAttributedString
    }
    
    
    private func buildAttributedStringWithTextAttachment(image: UIImage, font: UIFont) -> NSAttributedString {
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
        textAttachment.bounds = CGRect(x: 0, y: (font.capHeight - font.lineHeight) / 2.0, width: font.lineHeight, height: font.lineHeight)
        return NSAttributedString(attachment: textAttachment)
    }
    
    
    /// This will return a unicode scalar string from unicode input.
    /// It expects a single character emoji.
    /// ex. 😂 --> 1f602
    
    /**
     This will return a unicode scalar string from unicode input.
     It expects a single character emoji.
     ex. 😂 --> 1f602
     */
    
    func unicodeToScalarString(emoji: String) -> String {
        guard let unicodeScalars = emoji.first?.unicodeScalars else { return "" }
        
        return unicodeScalars.map { String(format:"%02X", $0.value).lowercased() }.joined(separator:"-")
    }
    
    
    private func getEmojiImage(filename: String) -> UIImage? {
        let urlString = "\(imagePathPNG)/\(emojiVersion)/png/\(emojiSize)/\(filename).png"
        
        guard let url = URL(string: urlString) else { return nil }
        
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        
        return UIImage(data: imageData)
    }
}
