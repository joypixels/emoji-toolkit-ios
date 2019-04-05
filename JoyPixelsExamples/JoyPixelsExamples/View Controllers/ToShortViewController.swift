//
//  ToShortViewController.swift
//  JoyPixelsExamples
//
//  Created by Alex Yip on 6/27/18.
//  Copyright © 2019 JoyPixels Inc. All rights reserved.
//

import UIKit
import JoyPixels

class ToShortViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    let client: ClientInterface = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let emojiString = textField.text else { return }

        label.text = client.toShort(string: emojiString)
    }
}
