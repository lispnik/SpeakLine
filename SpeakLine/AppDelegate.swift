//
//  AppDelegate.swift
//  SpeakLine
//
//  Created by Matthew Kennedy on 4/22/20.
//  Copyright © 2020 Matthew Kennedy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var controller: MainWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let controller = MainWindowController()
        controller.showWindow(self)
        self.controller = controller
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

