//
//  Ruleset.swift
//  Emojione
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import Foundation

public class Ruleset: RulesetInterface {
    
    public init() { }
    
    private let shortcodeReplace: [String : String] = [
        ":joy:": "\u{1f602}",
        ":dog:": "\u{1F436}",
        ":train:": "\u{1f68b}",
        ":writing_hand_tone1:": "\u{270d}\u{1f3fb}",
        ":kiss_woman_man:": "\u{1f469}\u{200d}\u{2764}\u{fe0f}\u{200d}\u{1f48b}\u{200d}\u{1f468}"
    ]
    
    private let asciiReplace: [String : String] = [
        "*\\0/*" : ":person_gesturing_ok:",
        "\\0/" : ":person_gesturing_ok:",
        "*\\O/*" : ":person_gesturing_ok:",
        "\\O/" : ":person_gesturing_ok:",
        "O:-)" : ":innocent:",
        "0:-3" : ":innocent:",
        "0:3" : ":innocent:",
        "0:-)" : ":innocent:",
        "0:)" : ":innocent:",
        "0;^)" : ":innocent:",
        "O:)" : ":innocent:",
        "O;-)" : ":innocent:",
        "O=)" : ":innocent:",
        "0;-)" : ":innocent:",
        "O:-3" : ":innocent:",
        "O:3" : ":innocent:",
        "</3" : ":broken_heart:",
        "B-)" : ":sunglasses:",
        "B)" : ":sunglasses:",
        "8)" : ":sunglasses:",
        "8-)" : ":sunglasses:",
        "B-D" : ":sunglasses:",
        "8-D" : ":sunglasses:",
        "-_-" : ":expressionless:",
        "-__-" : ":expressionless:",
        "-___-" : ":expressionless:",
        ">:\\" : ":confused:",
        ">:/" : ":confused:",
        ":-/" : ":confused:",
        ":-." : ":confused:",
        ":/" : ":confused:",
        ":\\" : ":confused:",
        "=/" : ":confused:",
        "=\\" : ":confused:",
        ":L" : ":confused:",
        "=L" : ":confused:",
        ":-O" : ":open_mouth:",
        ":O" : ":open_mouth:",
        "O_O" : ":open_mouth:",
        ">:O" : ":open_mouth:",
        ":-X" : ":no_mouth:",
        ":X" : ":no_mouth:",
        ":-#" : ":no_mouth:",
        ":#" : ":no_mouth:",
        "=X" : ":no_mouth:",
        "=#" : ":no_mouth:",
        ":\")" : ":joy:",
        ":\"-)" : ":joy:",
        "\":)" : ":sweat_smile:",
        "\":-)" : ":sweat_smile:",
        "\"=)" : ":sweat_smile:",
        "\":D" : ":sweat_smile:",
        "\":-D" : ":sweat_smile:",
        "\"=D" : ":sweat_smile:",
        ">:)" : ":laughing:",
        ">;)" : ":laughing:",
        ">:-)" : ":laughing:",
        ">=)" : ":laughing:",
        "\":(" : ":sweat:",
        "\":-(" : ":sweat:",
        "\"=(" : ":sweat:",
        ">:P" : ":stuck_out_tongue_winking_eye:",
        "X-P" : ":stuck_out_tongue_winking_eye:",
        ">:[" : ":disappointed:",
        ":-(" : ":disappointed:",
        ":(" : ":disappointed:",
        ":-[" : ":disappointed:",
        ":[" : ":disappointed:",
        "=(" : ":disappointed:",
        ">:(" : ":angry:",
        ">:-(" : ":angry:",
        ":@" : ":angry:",
        ":\"(" : ":cry:",
        ":\"-(" : ":cry:",
        ";(" : ":cry:",
        ";-(" : ":cry:",
        ">.<" : ":persevere:",
        "#-)" : ":dizzy_face:",
        "#)" : ":dizzy_face:",
        "%-)" : ":dizzy_face:",
        "%)" : ":dizzy_face:",
        "X)" : ":dizzy_face:",
        "X-)" : ":dizzy_face:",
        ":)" : ":slight_smile:",
        ":-)" : ":slight_smile:",
        "=]" : ":slight_smile:",
        "=)" : ":slight_smile:",
        ":]" : ":slight_smile:",
        ":P" : ":stuck_out_tongue:",
        ":-P" : ":stuck_out_tongue:",
        "=P" : ":stuck_out_tongue:",
        ":-Þ" : ":stuck_out_tongue:",
        ":Þ" : ":stuck_out_tongue:",
        ":-b" : ":stuck_out_tongue:",
        ":b" : ":stuck_out_tongue:",
        "<3" : ":heart:",
        ":D" : ":smiley:",
        ":-D" : ":smiley:",
        "=D" : ":smiley:",
        ";)" : ":wink:",
        ";-)" : ":wink:",
        "*-)" : ":wink:",
        "*)" : ":wink:",
        ";-]" : ":wink:",
        ";]" : ":wink:",
        ";D" : ":wink:",
        ";^)" : ":wink:",
        ":*" : ":kissing_heart:",
        ":-*" : ":kissing_heart:",
        "=*" : ":kissing_heart:",
        ":^*" : ":kissing_heart:",
        "D:" : ":fearful:",
        ":$" : ":flushed:",
        "=$" : ":flushed:",
        "(y)" : ":thumbsup:"
    ]
    
    private var asciiRegexp = "\\*\\\\0\\/\\*|\\\\0\\/|\\*\\\\O\\/\\*|\\\\O\\/|O:-\\)|0:-3|0:3|0:-\\)|0:\\)|0;\\^\\)|O:\\)|O;-\\)|O=\\)|0;-\\)|O:-3|O:3|<\\/3|B-\\)|B\\)|8\\)|8-\\)|B-D|8-D|-_-|-__-|-___-|>:\\\\|>:\\/|:-\\/|:-\\.|:\\/|:\\\\|=\\/|=\\\\|:L|=L|:-O|:O|O_O|>:O|:-X|:X|:-#|:#|=X|=#|:(\"|“)\\)|:(\"|“)-\\)|(\"|“):\\)|(\"|“):-\\)|(\"|“)=\\)|(\"|“):D|(\"|“):-D|(\"|“)=D|>:\\)|>;\\)|>:-\\)|>=\\)|(\"|“):\\(|(\"|“):-\\(|(\"|“)=\\(|>:P|X-P|>:\\[|:-\\(|:\\(|:-\\[|:\\[|=\\(|>:\\(|>:-\\(|:@|:(\"|“)\\(|:(\"|“)-\\(|;\\(|;-\\(|>\\.<|#-\\)|#\\)|%-\\)|%\\)|X\\)|X-\\)|:\\)|:-\\)|=]|=\\)|:]|:P|:-P|=P|:-Þ|:Þ|:-b|:b|<3|:D|:-D|=D|;\\)|;-\\)|\\*-\\)|\\*\\)|;-]|;]|;D|;\\^\\)|:\\*|:-\\*|=\\*|:\\^\\*|D:|:\\$|=\\$|\\(y\\)"
    
    private var unicodeReplace : [String: String] = [
        "\u{1f602}": ":joy:",
        "\u{1F436}": ":dog:",
        "\u{1f68b}": ":train:",
        "\u{270d}\u{1f3fb}": ":writing_hand_tone1:",
        "\u{1f469}\u{200d}\u{2764}\u{fe0f}\u{200d}\u{1f48b}\u{200d}\u{1f468}": ":kiss_woman_man:"
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
        return asciiReplace
    }
    
    
    /// Returns the unicode shortcode replacement rules
    
    /**
     Returns the unicode shortcode replacement rules
     */
    
    public func getUnicodeReplace() -> [String : String] {
        return unicodeReplace
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
    
    public func getAsciiRegexp() -> String {
        return asciiRegexp
    }
}
