//
//  AppDelegate.swift
//  RIBs(TCA)
//
//  Created by RomTheSheep on 24/4/24.
//

import UIKit


import RIBs
import RxSwift
import UIKit

/// Game app delegate.
@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    /// The window.
    public var window: UIWindow?

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let launchRouter = ArtworkListBuilder(dependency: AppComponent()).build()
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)

        return true
    }

    // MARK: - Private

    private var launchRouter: LaunchRouting?
}
