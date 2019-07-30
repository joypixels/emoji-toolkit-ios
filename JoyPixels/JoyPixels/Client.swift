//
//  Client.swift
//  JoyPixels
//
//  Created by Alex Yip on 6/22/18.
//  Copyright © 2019 JoyPixels Inc. All rights reserved.
//

import Foundation

public class Client: ClientInterface {

    public var ascii: Bool = false  // convert ascii smileys?
    public var riskyMatchAscii: Bool = false  // set true to match ascii without leading/trailing space char
    public var shortcodes: Bool = true  // convert shortcodes?

    public var emojiVersion: String = "5.0"
    public var emojiSize: EmojiSize = .size32

    public var greedyMatch: Bool = false
    public var imagePathPNG = "https://cdn.jsdelivr.net/joypixels/assets"

    public var shortcodeRegEx: String = ":([-+\\w]+):"
    public var unicodeRegEx: String = "(?:\x{1f9d1}[\x{1f3fb}-\x{1f3ff}]?\x{200d}\x{1f91d}\x{200d}\x{1f9d1}[\x{1f3fb}-\x{1f3ff}]?)|(?:[\x{1F3F3}|\x{1F3F4}]\x{FE0F}?\x{200D}?[\x{1F308}|\x{2620}]\x{FE0F}?)|(?:\x{1F441}\x{FE0F}?\x{200D}?\x{1F5E8}\x{FE0F}?)|(?:[\x{1f468}|\x{1f469}]\x{200d}\x{2764}\x{fe0f}?\x{200d}[\x{1f48b}\x{200d}]*[\x{1f468}|\x{1f469}])|(?:[\x{1f468}|\x{1f469}]\x{200d}[\x{1f468}|\x{1f469}]\x{200d}[\x{1f466}|\x{1f467}]\x{200d}[\x{1f466}|\x{1f467}])|(?:[\x{1f468}|\x{1f469}]\x{200d}[\x{1f466}|\x{1f467}]\x{200d}[\x{1f466}|\x{1f467}])|(?:[\x{1f468}|\x{1f469}]\x{200d}[\x{1f468}|\x{1f469}]\x{200d}[\x{1f466}|\x{1f467}])|(?:[\x{1f468}|\x{1f469}]\x{200d}[\x{1f466}|\x{1f467}])|(?:[\x{1F9B8}|\x{1F9B9}]+[\x{1F3FB}-\x{1F3FF}]?\x{200D}[\x{2640}-\x{2642}]?\x{FE0F}?)|(?:[\x{1F468}|\x{1F469}]+[\x{1F3FB}-\x{1F3FF}]?\x{200D}[\x{1F9B0}-\x{1F9B3}]+\x{FE0F}?)|[\x{0023}-\x{0039}]\x{FE0F}?\x{20e3}|(?:\x{1F3F4}[\x{E0060}-\x{E00FF}]{1,6})|[\x{1F1E0}-\x{1F1FF}]{2}|(?:[\x{1F468}|\x{1F469}]\x{FE0F}?[\x{1F3FB}-\x{1F3FF}]?\x{200D}?[\x{2695}|\x{2696}|\x{2708}|\x{1F4BB}|\x{1F4BC}|\x{1F527}|\x{1F52C}|\x{1F680}|\x{1F692}|\x{1F33E}|\x{1F3EB}|\x{1F3EC}|\x{1f373}|\x{1f393}|\x{1f3a4}|\x{1f3ed}|\x{1f3a8}]\x{FE0F}?)|[\x{1F468}-\x{1F469}\x{1F9D0}-\x{1F9DF}][\x{1F3FA}-\x{1F3FF}]?\x{200D}?[\x{2640}\x{2642}\x{2695}\x{2696}\x{2708}]?\x{FE0F}?|(?:[\x{1F9B5}|\x{1F9B6}]+[\x{1F3FB}-\x{1F3FF}]+)|(?:[\x{1f46e}\x{1F468}\x{1F469}\x{1f575}\x{1f471}-\x{1f487}\x{1F645}-\x{1F64E}\x{1F926}\x{1F937}]|[\x{1F460}-\x{1F482}\x{1F3C3}-\x{1F3CC}\x{26F9}\x{1F486}\x{1F487}\x{1F6A3}-\x{1F6B6}\x{1F938}-\x{1F93E}]|\x{1F46F})\x{FE0F}?[\x{1F3FA}-\x{1F3FF}]?\x{200D}?[\x{2640}\x{2642}]?\x{FE0F}?|(?:[\x{26F9}\x{261D}\x{270A}-\x{270D}\x{1F385}-\x{1F3CC}\x{1F442}-\x{1F4AA}\x{1F574}-\x{1F596}\x{1F645}-\x{1F64F}\x{1F6A3}-\x{1F6CC}\x{1F918}-\x{1F93E}]\x{FE0F}?[\x{1F3FA}-\x{1F3FF}])|(?:[\x{2194}-\x{2199}\x{21a9}-\x{21aa}]\x{FE0F}?|[\x{0023}-\x{002a}]|[\x{3030}\x{303d}]\x{FE0F}?|(?:[\x{1F170}-\x{1F171}]|[\x{1F17E}-\x{1F17F}]|\x{1F18E}|[\x{1F191}-\x{1F19A}]|[\x{1F1E6}-\x{1F1FF}])\x{FE0F}?|\x{24c2}\x{FE0F}?|[\x{3297}\x{3299}]\x{FE0F}?|(?:[\x{1F201}-\x{1F202}]|\x{1F21A}|\x{1F22F}|[\x{1F232}-\x{1F23A}]|[\x{1F250}-\x{1F251}])\x{FE0F}?|[\x{203c}\x{2049}]\x{FE0F}?|[\x{25aa}-\x{25ab}\x{25b6}\x{25c0}\x{25fb}-\x{25fe}]\x{FE0F}?|[\x{00a9}\x{00ae}]\x{FE0F}?|[\x{2122}\x{2139}]\x{FE0F}?|\x{1F004}\x{FE0F}?|[\x{2b05}-\x{2b07}\x{2b1b}-\x{2b1c}\x{2b50}\x{2b55}]\x{FE0F}?|[\x{231a}-\x{231b}\x{2328}\x{23cf}\x{23e9}-\x{23f3}\x{23f8}-\x{23fa}]\x{FE0F}?|\x{1F0CF}|[\x{2934}\x{2935}]\x{FE0F}?)|[\x{2700}-\x{27bf}]\x{FE0F}?|[\x{1F000}-\x{1F6FF}\x{1F900}-\x{1F9FF}]\x{FE0F}?|[\x{2600}-\x{26ff}]\x{FE0F}?|(?:[\x{1F466}-\x{1F469}]+\x{FE0F}?[\x{1F3FB}-\x{1F3FF}]?)|[\x{0030}-\x{0039}]\x{FE0F}"

    public private(set) var ruleset: RulesetInterface

    /// ruleset: Optional
    /// Only used for custom rulesets. Just call init()
    /// for default ruleset. (Recommended)

    /**
     ruleset: Optional
     Only used for custom rulesets. Just call init()
     for default ruleset. (Recommended)
     */

    public init(ruleset: RulesetInterface = Ruleset()) {
        self.ruleset = ruleset
    }

    /// First pass changes any shortnames into emoji markup.
    /// Second pass changes unicode characters into emoji markup.

    /**
     First pass changes any shortnames into emoji markup.
     Second pass changes unicode characters into emoji markup.
     */

    public func toImage(string: String, font: UIFont) -> NSAttributedString {
        let result = shortnameToUnicode(string: string)

        return unicodeToImage(string: result, font: font)
    }

    /// First pass changes unicode characters into emoji markup.
    /// Second pass changes any shortnames into emoji markup.
    /// Callback when emoji images are downloaded.

    /**
     First pass changes unicode characters into emoji markup.
     Second pass changes any shortnames into emoji markup.
     Callback when emoji images are downloaded.
     */

    public func toImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void) {
        let result = shortnameToUnicode(string: string)

        unicodeToImageAsync(string: result, font: font, callback: callback)
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
        let result = toShort(string: string)
        return shortnameToUnicode(string: result)
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
            return ruleset.getShortcodeReplace()[shortcode]?.0 ?? shortcode
        }
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
        let asciiRegex = riskyMatchAscii ? "(?:\(ruleset.getAsciiRegexp()))" : "(?:(\\s|^)\(ruleset.getAsciiRegexp()))"

        return regexReplace(regexString: asciiRegex, string: string) { ascii -> String in
            let smiley = ascii.trimmingCharacters(in: .whitespacesAndNewlines)
            let shortname = ruleset.getAsciiReplace()[smiley] ?? smiley
            return ascii.replacingOccurrences(of: smiley, with: shortname)
        }
    }

    /// This will output image markup from shortname input.

    /**
     This will output image markup from shortname input.
     */

    public func shortnameToImage(string: String, font: UIFont) -> NSAttributedString {
        let unicodeString = shortnameToUnicode(string: string)
        return unicodeToImage(string: unicodeString, font: font)
    }

    /// This will output image markup from shortname input with asynchronous callback.

    /**
     This will output image markup from shortname input with asynchronous callback.
     */

    public func shortnameToImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void) {
        let unicodeString = shortnameToUnicode(string: string)
        unicodeToImageAsync(string: unicodeString, font: font, callback: callback)
    }

    /// This will return the shortname from unicode input.

    /**
     This will return the shortname from unicode input.
     */

    public func toShort(string: String) -> String {
        return regexReplace(regexString: unicodeRegEx, string: string) { emoji -> String in
            let hexString = convertToHexString(string: emoji)
            return ruleset.getUnicodeReplace()[hexString] ?? emoji
        }
    }

    /// This will output image markup from unicode input.

    /**
     This will output image markup from unicode input.
     */

    public func unicodeToImage(string: String, font: UIFont) -> NSAttributedString {
        var result = string

        if ascii {
            result = asciiToShortname(string: result)
            result = shortnameToUnicode(string: result)
        }

        return regexImageReplace(regexString: unicodeRegEx, string: result, font: font) { emoji -> UIImage? in

            let hexString = convertToHexString(string: emoji)

            guard let shortcode = ruleset.getUnicodeReplace()[hexString] ?? (greedyMatch ? ruleset.getUnicodeReplaceGreedy()[hexString] : nil) else { return nil }

            guard let filename = ruleset.getShortcodeReplace()[shortcode]?.1 else { return nil }

            return getEmojiImage(filename: filename)
        }
    }

    /// This will output image markup from unicode input with asynchronous callback.

    /**
     This will output image markup from unicode input with asynchronous callback.
     */

    public func unicodeToImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void) {
        var result = string

        if ascii {
            result = asciiToShortname(string: result)
            result = shortnameToUnicode(string: result)
        }

        regexImageReplaceAsync(regexString: unicodeRegEx, string: result, font: font, callback: callback)
    }

    // MARK: - Helper Methods

    /// Returns a regular expression matches in an array of tuples.
    /// The tuple contents are as follows:
    ///  0 - Matched string
    ///  1 - NSTextCheckingResult of match

    /**
     Returns a regular expression matches in an array of tuples.
     The tuple contents are as follows:
      0 - Matched string
      1 - NSTextCheckingResult of match
     */

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

    /// Replaces matched regular expression with a new string.
    ///  regexString - Regular expression
    ///  string - String to search
    ///  callback(matchedString) -> stringToReplace - A callback function
    ///    that passes back the match and must return the replacement string.

    /**
     Replaces matched regular expression with a new string.
      regexString - Regular expression
      string - String to search
      callback(matchedString) -> stringToReplace - A callback function
        that passes back the match and must return the replacement string.
     */

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

    /// Replaces matched regular expression with an UIImage.
    ///  regexString - Regular expression
    ///  string - String to search
    ///  font - Used to determine line height to properly size the image
    ///  callback(matchedString) -> imageToReplace - A callback function
    ///    that passes back the match and must return the replacement image.

    /**
     Replaces matched regular expression with an UIImage.
      regexString - Regular expression
      string - String to search
      font - Used to determine line height to properly size the image
      callback(matchedString) -> imageToReplace - A callback function
        that passes back the match and must return the replacement image.
     */

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

    /// Replaces matched regular expression with an UIImage asynchronously.
    ///  regexString - Regular expression
    ///  string - String to search
    ///  font - Used to determine line height to properly size the image
    ///  callback(NSAttributedString) -> Void - A callback function
    ///    that passes back the attributed string when replacements are complete.

    /**
     Replaces matched regular expression with an UIImage asynchronously.
      regexString - Regular expression
      string - String to search
      font - Used to determine line height to properly size the image
      callback(NSAttributedString) -> Void - A callback function
        that passes back the attributed string when replacements are complete.
     */

    private func regexImageReplaceAsync(regexString: String, string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void) {
        let mutableString = NSMutableAttributedString(string: string)
        var offset = 0

        let matches = regexMatches(regexString: regexString, string: string)

        let matchesWithFilenames = matches.map { ($0, $1, getFilename(emoji: $0)) }

        let filenames = matchesWithFilenames.map { $0.2 }.filter { $0 != nil }.map { $0! }

        downloadImagesAsync(filenames: filenames) { [weak self] images in
            guard let strongSelf = self else { return }

            for (_, match, filename) in matchesWithFilenames {
                var resultRange = match.range
                resultRange.location += offset

                guard let filename = filename, let image = images[filename] else { continue }

                let attrStringWithImage = strongSelf.buildAttributedStringWithTextAttachment(image: image, font: font)

                mutableString.replaceCharacters(in: resultRange, with: attrStringWithImage)

                offset += attrStringWithImage.length - resultRange.length
            }

            callback(mutableString as NSAttributedString)
        }
    }

    /// Gets associated JoyPixels filename from unicode emoji.

    /**
     Gets associated JoyPixels filename from unicode emoji.
     */

    private func getFilename(emoji: String) -> String? {
        let hexString = convertToHexString(string: emoji)

        guard let shortcode = ruleset.getUnicodeReplace()[hexString] ?? (greedyMatch ? ruleset.getUnicodeReplaceGreedy()[hexString] : nil) else { return nil }

        guard let filename = ruleset.getShortcodeReplace()[shortcode]?.1 else { return nil }

        return filename
    }

    /// Downloads a list of filenames from JoyPixels servers asynchronously.

    /**
     Downloads a list of filenames from JoyPixels servers asynchronously.
     */

    private func downloadImagesAsync(filenames: [String], callback: @escaping ([String: UIImage]) -> Void) {
        var result: [String: UIImage] = [:]
        let group = DispatchGroup()

        for filename in filenames {
            group.enter()
            getEmojiImageAsync(filename: filename) { (image) in
                guard let image = image else { return }
                result[filename] = image
                group.leave()
            }
        }

        group.notify(queue: .main) {
            callback(result)
        }
    }

    /// Builds an image attachment for a NSAttributedString.

    /**
     Builds an image attachment for a NSAttributedString.
     */

    private func buildAttributedStringWithTextAttachment(image: UIImage, font: UIFont) -> NSAttributedString {
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
        textAttachment.bounds = CGRect(x: 0, y: (font.capHeight - font.lineHeight) / 2.0, width: font.lineHeight, height: font.lineHeight)
        return NSAttributedString(attachment: textAttachment)
    }

    /// Builds URL object from JoyPixels filename.

    /**
     Builds URL object from JoyPixels filename.
     */

    private func getJoyPixelsUrl(filename: String) -> URL? {
        let urlString = "\(imagePathPNG)/\(emojiVersion)/png/unicode/\(emojiSize.rawValue)/\(filename).png"
        return URL(string: urlString)
    }

    /// Gets emoji image from JoyPixels' CDN.
    /// Returns nil if unable to download image.

    /**
     Gets emoji image from JoyPixels' CDN.
     Returns nil if unable to download image.
     */

    private func getEmojiImage(filename: String) -> UIImage? {
        guard let url = getJoyPixelsUrl(filename: filename) else { return nil }

        guard let imageData = try? Data(contentsOf: url) else { return nil }

        return UIImage(data: imageData)
    }

    /// Gets emoji image from JoyPixels' CDN asynchronously.
    /// Returns nil if unable to download image.

    /**
     Gets emoji image from JoyPixels' CDN asynchronously.
     Returns nil if unable to download image.
     */

    private func getEmojiImageAsync(filename: String, callback: @escaping (UIImage?) -> Void) {
        guard let url = getJoyPixelsUrl(filename: filename) else { callback(nil); return }

        URLSession.shared.dataTask(with: url) { (data, _, _) -> Void in
            if let imageData = data, let image = UIImage(data: imageData) {
                callback(image)
            } else {
                callback(nil)
            }
        }.resume()
    }

    /// Converts unicode string to hexademical byte string.
    /// Ex: 😂 -> F09F9882

    /**
     Converts unicode string to hexademical byte string
     Ex: 😂 -> F09F9882
     */

    private func convertToHexString(string: String) -> String {
        let buffer: [UInt8] = Array(string.utf8)
        return buffer.map { String(format: "%02X", $0) }.joined()
    }
}
