//
//  ClockScene.swift
//  G-Sensor WatchKit Extension
//
//  Created by Mohammed Azeem on 21/12/22.
//

import Foundation
import SpriteKit

class ClockScene: SKScene {
    //Define SKSpriteNode for watch hands
    var secondHand:SKSpriteNode = SKSpriteNode()
    var minuteHand:SKSpriteNode = SKSpriteNode()
    var hourHand:SKSpriteNode = SKSpriteNode()
    var background = SKSpriteNode(imageNamed: "face1")
    
    override func sceneDidLoad() {
        if let secHand:SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode{
            secondHand = secHand
        }
        if let minHand:SKSpriteNode = self.childNode(withName: "MinuteHand") as? SKSpriteNode{
            minuteHand = minHand
        }
        if let hrHand:SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode{
            hourHand = hrHand
        }
        
        background.zPosition = 1
        background.position = CGPoint(x: frame.size.width, y: frame.size.height)
        addChild(background)
        
       // secondHand.position = CGPoint(x: frame.midX - 20 , y: frame.midY - 5)
       // minuteHand.position = CGPoint(x: frame.midX - 6 , y: frame.midY - 6)
       // hourHand.position = CGPoint(x: frame.midX - 6 , y: frame.midY - 6)
    }
    
   override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
    let date = Date()
    let calendar = Calendar.current
    let hour = CGFloat(calendar.component(.hour, from: date))
    let minutes = CGFloat(calendar.component(.minute, from: date))
    let seconds = CGFloat(calendar.component(.second, from: date))
    secondHand.zRotation = -1 * deg2rad(seconds * 6)
    minuteHand.zRotation = -1 * deg2rad(minutes * 6)
    hourHand.zRotation = -1 * deg2rad(hour * 30 + minutes/2)
  }
    
  func deg2rad(_ number: CGFloat) -> CGFloat {
    return number * .pi / 180
   }
}

