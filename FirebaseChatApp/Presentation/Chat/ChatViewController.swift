//
//  ChatViewController.swift
//  FirebaseChatApp
//
//  Created by Tomoya Hayakawa on 2019/12/04.
//  Copyright © 2019 simorgh3196. All rights reserved.
//

import Firebase
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var messageTextField: UITextField!
    @IBOutlet private weak var sendButton: UIButton!

    private let databaseRef: DatabaseReference

    init() {
        databaseRef = Database.database().reference()
        super.init(nibName: String(describing: ChatViewController.self), bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef.observe(.childAdded) { [weak self] snapshot in
            guard let value = snapshot.value as? [String: Any],
                let name = value["name"] as? String,
                let message = value["message"] as? String
                else { return }

            self?.textView.text += "\n\(name): \(message)"
        }
    }

    @IBAction private func didTapSendButton(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
            let message = messageTextField.text, !message.isEmpty
            else { return }

        databaseRef.childByAutoId().setValue([
            "name": name,
            "message": message
        ])
        messageTextField.text = ""
    }
}
