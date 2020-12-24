//
//  AppDelegate.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import UIKit
import Then
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    AppResolver.registerAllServices()
    
    window = UIWindow().then {
      $0.frame = UIScreen.main.bounds
      $0.rootViewController = HomeViewController()
      $0.makeKeyAndVisible()
    }
    
    return true
  }
  
}

