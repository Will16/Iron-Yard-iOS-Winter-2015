//
//  ViewController.swift
//  Ball
//
//  Created by William McDuff on 2015-02-10.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate {

    
    
    var session: MCSession!
    var myPeerId: MCPeerID!
    var advertiser: MCNearbyServiceAdvertiser!
    
    
    let serviceType = "b2"
    
    var colorR = "0.20"
    var colorB = "0.98"
    var colorG = "0.44"
    var size = "32"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPeerId = MCPeerID(displayName: "Will")
        
        session = MCSession(peer: myPeerId)
        
        session.delegate = self
        
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: ["colorR":colorR, "colorB":colorB,  "colorG":colorG, "size":size], serviceType: serviceType)
        advertiser.delegate = self
        
      
        advertiser.startAdvertisingPeer()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        println("data from \(peerID)")
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        // state conneceted, not connceted print who we are connected to
        println("\(state.rawValue) = \(peerID)")
    }
    
    var roomPeerID: MCPeerID?

    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        roomPeerID = peerID
        println("invite from \(peerID)")
        
        invitationHandler(true, session)
        
        
        
    }
    
    
    func sendMove(x: CGFloat, y: CGFloat) {
        
        let moveInfo = ["x":x, "y":y]
        
        let moveData = NSJSONSerialization.dataWithJSONObject(moveInfo, options: NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            
            var error: NSError?
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: &error)

            
            println(error)
        }
    }
    var lastLocation: CGPoint?
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        // the last touch
        if let touch = touches.allObjects.last as? UITouch {
            
            // if the last tuch is in view
            let location = touch.locationInView(view)
            
            // if there was a touch before, calculater the coord difference between this location and the last
            if let ll = lastLocation {
                
                let xMove = location.x - ll.x
                let yMove = location.y - ll.y
                
                self.sendMove(xMove, y: yMove)
            }
            // put this location as the last
            
            lastLocation = location
        }
    }
    
 
    // A nearby pee
}

