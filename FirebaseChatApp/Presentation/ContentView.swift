//
//  ContentView.swift
//  FirebaseChatApp
//
//  Created by Tomoya Hayakawa on 2019/12/04.
//  Copyright © 2019 simorgh3196. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ChatViewControllerWrapper()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class SampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct ChatViewControllerWrapper: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<ChatViewControllerWrapper>) -> ChatViewController {
        return ChatViewController()
    }

    func updateUIViewController(_ uiViewController: ChatViewController, context: UIViewControllerRepresentableContext<ChatViewControllerWrapper>) {
    }
}
