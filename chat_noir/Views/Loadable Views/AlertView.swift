//
//  AlertView.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class AlertView: LoadableView {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    func setupError (_ message: String) {
        titleLbl.text = "Une erreur est survenue"
        messageLbl.text = message
        btn1.isHidden = true
        btn2.isHidden = true
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0: MyNotifCenter().post("cancel", nil)
            default: break
        }
        
    }
    
}
