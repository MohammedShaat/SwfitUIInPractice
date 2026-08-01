//
//  SwfitUIInPracticeApp.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

@main
struct SwfitUIInPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
