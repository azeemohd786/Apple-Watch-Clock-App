//
//  InterfaceController.swift
//  SampleWatchiOSApp WatchKit Extension
//
//  Created by Mohammed Azeem on 05/11/22.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var mainGroup: WKInterfaceGroup!
    @IBOutlet weak var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        let app = Dynamic.PUICApplication.sharedPUICApplication()
        app._setStatusBarTimeHidden(true, animated: false, completion: nil)
         
         if let scene = ClockScene(fileNamed: "ClockScene") {
             scene.backgroundColor = .clear
             scene.scaleMode = .aspectFill
             self.skInterface.presentScene(scene)
             self.skInterface.preferredFramesPerSecond = 30
         }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
   
}



