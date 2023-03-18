//
//  ViewController.swift
//  SampleWatchiOSApp
//
//  Created by Mohammed Azeem on 05/11/22.
//

import UIKit
import WatchConnectivity//1

class ViewController: UIViewController {
    
    var session : WCSession?
    @IBOutlet weak var wallpaperImage: UIImageView!
    @IBOutlet weak var reachableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureWatchKitSession()
        
    }
    
    func configureWatchKitSession() {
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    @IBAction func tapSendDataToWatch(_ sender: Any) {
        
        if let validSession = self.session, validSession.isReachable {//5.1
          let data: [String: Any] = ["iPhone": "Data from iPhone" as Any] // Create your Dictionay as per uses
          validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
      }


}

extension ViewController: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
               print("WC Session activation failed with error: \(error.localizedDescription)")
               return
        }
        
        if WCSession.default.isReachable {
                print("Reachable")
           }
           else {
               print("Not reachable")
           }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
      print("received message: \(message)")
      DispatchQueue.main.async { //6
        if let value = message["watch"] as? String {
              self.wallpaperImage.image = UIImage(named: value)
        }
      }
    }
      
      func sessionReachabilityDidChange(_ session: WCSession) {
          print(session.isReachable)
          var isReachable = false
          if WCSession.default.activationState == .activated {
              isReachable = WCSession.default.isReachable
          }
          reachableLabel.backgroundColor = isReachable ? .green : .red
          reachableLabel.textColor = isReachable ? .black : .white
      }
    
    
}
