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

    public var emojiVersion: String = "6.0"
    public var emojiSize: EmojiSize = .size32

    public var greedyMatch: Bool = false
    public var imagePathPNG = "https://cdn.jsdelivr.net/joypixels/assets"

    public var shortcodeRegEx: String = ":([-+\\w]+):"
    public var unicodeRegEx: String = "(?:\\u1f9d1[\\u1f3fb-\\u1f3ff]?\\u200d\\u1f91d\\u200d\\u1f9d1[\\u1f3fb-\\u1f3ff]?)|(?:[\\u1F3F3|\\u1F3F4]\\uFE0F?\\u200D?[\\u1F308|\\u2620]\\uFE0F?)|(?:\\u1F441\\uFE0F?\\u200D?\\u1F5E8\\uFE0F?)|(?:[\\u1f468|\\u1f469]\\u200d\\u2764\\ufe0f?\\u200d[\\u1f48b\\u200d]*[\\u1f468|\\u1f469])|(?:[\\u1f468|\\u1f469]\\u200d[\\u1f468|\\u1f469]\\u200d[\\u1f466|\\u1f467]\\u200d[\\u1f466|\\u1f467])|(?:[\\u1f468|\\u1f469]\\u200d[\\u1f466|\\u1f467]\\u200d[\\u1f466|\\u1f467])|(?:[\\u1f468|\\u1f469]\\u200d[\\u1f468|\\u1f469]\\u200d[\\u1f466|\\u1f467])|(?:[\\u1f468|\\u1f469]\\u200d[\\u1f466|\\u1f467])|(?:[\\u1F9B8|\\u1F9B9]+[\\u1F3FB-\\u1F3FF]?\\u200D[\\u2640-\\u2642]?\\uFE0F?)|(?:[\\u1F468|\\u1F469]+[\\u1F3FB-\\u1F3FF]?\\u200D[\\u1F9B0-\\u1F9B3]+\\uFE0F?)|[\\u0023-\\u0039]\\uFE0F?\\u20e3|(?:\\u1F3F4[\\uE0060-\\uE00FF]{1,6)|[\\u1F1E0-\\u1F1FF]{2|(?:[\\u1F468|\\u1F469]\\uFE0F?[\\u1F3FB-\\u1F3FF]?\\u200D?[\\u2695|\\u2696|\\u2708|\\u1F4BB|\\u1F4BC|\\u1F527|\\u1F52C|\\u1F680|\\u1F692|\\u1F33E|\\u1F3EB|\\u1F3EC|\\u1f373|\\u1f393|\\u1f3a4|\\u1f3ed|\\u1f3a8]\\uFE0F?)|[\\u1F468-\\u1F469\\u1F9D0-\\u1F9DF][\\u1F3FA-\\u1F3FF]?\\u200D?[\\u2640\\u2642\\u2695\\u2696\\u2708]?\\uFE0F?|(?:[\\u1F9B5|\\u1F9B6]+[\\u1F3FB-\\u1F3FF]+)|(?:[\\u1f46e\\u1F468\\u1F469\\u1f575\\u1f471-\\u1f487\\u1F645-\\u1F64E\\u1F926\\u1F937]|[\\u1F460-\\u1F482\\u1F3C3-\\u1F3CC\\u26F9\\u1F486\\u1F487\\u1F6A3-\\u1F6B6\\u1F938-\\u1F93E]|\\u1F46F)\\uFE0F?[\\u1F3FA-\\u1F3FF]?\\u200D?[\\u2640\\u2642]?\\uFE0F?|(?:[\\u26F9\\u261D\\u270A-\\u270D\\u1F385-\\u1F3CC\\u1F442-\\u1F4AA\\u1F574-\\u1F596\\u1F645-\\u1F64F\\u1F6A3-\\u1F6CC\\u1F918-\\u1F93E]\\uFE0F?[\\u1F3FA-\\u1F3FF])|(?:[\\u2194-\\u2199\\u21a9-\\u21aa]\\uFE0F?|[\\u0023-\\u002a]|[\\u3030\\u303d]\\uFE0F?|(?:[\\u1F170-\\u1F171]|[\\u1F17E-\\u1F17F]|\\u1F18E|[\\u1F191-\\u1F19A]|[\\u1F1E6-\\u1F1FF])\\uFE0F?|\\u24c2\\uFE0F?|[\\u3297\\u3299]\\uFE0F?|(?:[\\u1F201-\\u1F202]|\\u1F21A|\\u1F22F|[\\u1F232-\\u1F23A]|[\\u1F250-\\u1F251])\\uFE0F?|[\\u203c\\u2049]\\uFE0F?|[\\u25aa-\\u25ab\\u25b6\\u25c0\\u25fb-\\u25fe]\\uFE0F?|[\\u00a9\\u00ae]\\uFE0F?|[\\u2122\\u2139]\\uFE0F?|\\u1F004\\uFE0F?|[\\u2b05-\\u2b07\\u2b1b-\\u2b1c\\u2b50\\u2b55]\\uFE0F?|[\\u231a-\\u231b\\u2328\\u23cf\\u23e9-\\u23f3\\u23f8-\\u23fa]\\uFE0F?|\\u1F0CF|[\\u2934\\u2935]\\uFE0F?)|[\\u2700-\\u27bf]\\uFE0F?|[\\u1F000-\\u1F6FF\\u1F900-\\u1F9FF]\\uFE0F?|[\\u2600-\\u26ff]\\uFE0F?|(?:[\\u1F466-\\u1F469]+\\uFE0F?[\\u1F3FB-\\u1F3FF]?)|[\\u0030-\\u0039]\\uFE0F"

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
