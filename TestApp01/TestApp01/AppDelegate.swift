//
//  AppDelegate.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController(viewModel: StopWatchViewModel())
        self.window?.makeKeyAndVisible()
        return true
    }
}
