//
//  ViewController.swift
//  UndoManagerTest
//
//  Created by Shion on 2021/04/24.
//

import UIKit

class ViewController: UIViewController {

    weak var textView: UITextView!

    override var undoManager: UndoManager? {
        self.textView.undoManager // What's _UITextUndoManager?
    }

    override func loadView() {
        let textView = UITextView(frame: .zero)
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.backgroundColor = .lightGray
        self.textView = textView
        self.view = textView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            forName: .NSUndoManagerWillUndoChange, object: self.undoManager, queue: nil, using: willUndoChange)
        notificationCenter.addObserver(
            forName: .NSUndoManagerDidUndoChange, object: self.undoManager, queue: nil, using: didUndoChange)
        notificationCenter.addObserver(
            forName: .NSUndoManagerWillRedoChange, object: self.undoManager, queue: nil, using: willRedoChange)
        notificationCenter.addObserver(
            forName: .NSUndoManagerDidRedoChange, object: self.undoManager, queue: nil, using: didRedoChange)
    }

    override func viewDidLayoutSubviews() {
        textView.frame = CGRect(x: 0, y: 24, width: 820, height: 1136)
    }

}

extension ViewController: UITextViewDelegate {

    func textView(_: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // I don't know, but it works.
        undoManager?.removeAllActions(withTarget: self)

        if text == "\n" {
            registerUndo()
        }

        return true
    }

    func registerUndo() {
        // I don't know, but it works.
        undoManager?.registerUndo(withTarget: self) {
            _ in self.registerUndo()
        }
    }

    func willUndoChange(_ notification: Notification) {
        print("\(#function): \(notification)")
        // willUndoChange(_:):
        //      name = NSUndoManagerWillUndoChangeNotification,
        //      object = Optional(<_UITextUndoManager: 0x600003218a50>),
        //      userInfo = nil
    }

    func didUndoChange(_ notification: Notification) {
        print("\(#function): \(notification)")
        // didUndoChange(_:):
        //      name = NSUndoManagerDidUndoChangeNotification,
        //      object = Optional(<_UITextUndoManager: 0x600003218a50>),
        //      userInfo = nil
    }

    func willRedoChange(_ notification: Notification) {
        print("\(#function): \(notification)")
        // willRedoChange(_:):
        //      name = NSUndoManagerWillRedoChangeNotification,
        //      object = Optional(<_UITextUndoManager: 0x600003218a50>),
        //      userInfo = nil
    }

    func didRedoChange(_ notification: Notification) {
        print("\(#function): \(notification)")
        // didRedoChange(_:):
        //      name = NSUndoManagerDidRedoChangeNotification,
        //      object = Optional(<_UITextUndoManager: 0x600003218a50>),
        //      userInfo = nil
    }

}
