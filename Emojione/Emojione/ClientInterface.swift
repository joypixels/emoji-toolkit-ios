//
//  ClientInterface.swift
//  Emojione
//
//  Created by Alex Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

public protocol ClientInterface {

    /// First pass changes unicode characters into emoji markup.
    /// Second pass changes any shortnames into emoji markup.

    /**
     First pass changes unicode characters into emoji markup.
     Second pass changes any shortnames into emoji markup.
     */

    func toImage(string: String, font: UIFont) -> NSAttributedString
    
    /// First pass changes unicode characters into emoji markup.
    /// Second pass changes any shortnames into emoji markup.
    /// Callback when emoji images are downloaded.
    
    /**
     First pass changes unicode characters into emoji markup.
     Second pass changes any shortnames into emoji markup.
     Callback when emoji images are downloaded.
     */
    
    func toImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void)

    /// Uses toShort to transform all unicode into a standard shortname
    /// then transforms the shortname into unicode.
    /// This is done for standardization when converting several unicode types.

    /**
     Uses toShort to transform all unicode into a standard shortname
     then transforms the shortname into unicode.
     This is done for standardization when converting several unicode types.
     */

    func unifyUnicode(string: String) -> String

    /// This will output unicode from shortname input.
    /// If Client/$ascii is true it will also output unicode from ascii.
    /// This is useful for sending emojis back to mobile devices.

    /**
     This will output unicode from shortname input.
     If Client/$ascii is true it will also output unicode from ascii.
     This is useful for sending emojis back to mobile devices.
     */

    func shortnameToUnicode(string: String) -> String

    /// This will replace ascii with their shortname equivalent
    /// ex. :) --> :slight_smile:
    /// This is useful for systems that don't ascii emoji.

    /**
     This will replace ascii with their shortname equivalent
     ex. :) --> :slight_smile:
     This is useful for systems that don't ascii emoji.
     */

    func asciiToShortname(string: String) -> String

    /// This will output image markup from shortname input.

    /**
     This will output image markup from shortname input.
     */

    func shortnameToImage(string: String, font: UIFont) -> NSAttributedString

    /// This will output image markup from shortname input with asynchronous callback.
    
    /**
     This will output image markup from shortname input with asynchronous callback.
     */
    
    func shortnameToImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void)
    
    /// This will return the shortname from unicode input.

    /**
     This will return the shortname from unicode input.
     */

    func toShort(string: String) -> String

    /// This will output image markup from unicode input.

    /**
     This will output image markup from unicode input.
     */

    func unicodeToImage(string: String, font: UIFont) -> NSAttributedString
    
    /// This will output image markup from unicode input with asynchronous callback.
    
    /**
     This will output image markup from unicode input with asynchronous callback.
     */
    
    func unicodeToImageAsync(string: String, font: UIFont, callback: @escaping (NSAttributedString) -> Void)
}
