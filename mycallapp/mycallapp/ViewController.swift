//
//  ViewController.swift
//  mycallapp
//
//  Created by Jiayu li on 2017-07-20.
//  Copyright © 2017 Jiayu li. All rights reserved.
//

import Cocoa
import sharedmodule

class ViewController: NSViewController {

    @IBOutlet weak var displayjson: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "http://www.ebizmis.com/standard.html") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response,error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    self.displayjson.stringValue = "\(json)"
                    let json2 = try JSON(data: data)
                    //self.displayjson.stringValue = "\(json2)"
                    self.displayjson.stringValue = "\(json2)\(json2["ircEvent"].stringValue)"
                    
                } catch {
                    print(error)
                }
            }
        }
        
        session.resume()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

