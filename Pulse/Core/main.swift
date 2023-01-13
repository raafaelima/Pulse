//
//  main.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import UIKit

// If we have a TestingAppDelegate (i.e. we're running unit tests), use that to avoid executing initialisation code in AppDelegate
// TheTestingAppDelegate class will only exist when running unit tests
let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
