//
//  ToImageViewController.swift
//  JoyPixelsExamples
//
//  Created by Alex Yip on 6/27/18.
//  Copyright © 2019 JoyPixels Inc. All rights reserved.
//

import UIKit
import JoyPixels

class ToImageViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    var asynchronous: Bool = true

    let client: ClientInterface = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let emojiString = textField.text else { return }

        if asynchronous {
            client.toImageAsync(string: emojiString, font: label.font) { [weak self] attributedString in
                self?.label.attributedText = attributedString
            }
        } else {
          label.attributedText = client.toImage(string: emojiString, font: label.font)
        }
    }
}
