//
//  ViewController.swift
//  Raid of Temples Launcher
//
//  Created by Tristan Poland on 12/18/21.
//

import UserNotifications
import Cocoa

class ViewController: NSViewController {
    func registerForPushNotifications() {
      //1
      UNUserNotificationCenter.current()
        //2
        .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
          //3
          print("Permission granted: \(granted)")
        }
    }
    func shell(_ args: String...) -> Int32 {
        let task = Process()
        let pipe = Pipe()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPushNotifications()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func playButtonPressed(_ sender: Any) {
        print(shell("ls"))
        shell("open", "/Users/tristanpoland/Desktop/Raid of Temples Launcher 2021-12-18 12-11-08/Raid of Temples Launcher.app/gamefiles/Stickies.app")
    }

}
