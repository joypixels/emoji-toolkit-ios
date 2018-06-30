//
//  ShortnameToUnicodeViewController.swift
//  EmojioneExamples
//
//  Created by Alex Yip on 6/27/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import UIKit
import Emojione

class ShortnameToUnicodeViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    let client: ClientInterface = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let emojiString = textField.text else { return }

        label.text = client.shortnameToUnicode(string: emojiString)
    }
}
