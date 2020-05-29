//
//  RootController.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class RootController: UIViewController {

    var alertView: AlertView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyNotifCenter().receiveNotif("cancel", self, #selector(closeAlert))
        
    }
    
    func showAlert (_ message: String?, _ type: AlertType) {
        if alertView != nil {
            closeAlert()
        }
        alertView = AlertView(frame: view.bounds)
        switch type {
            case .error: alertView?.setupError(message ?? "")
            default: break
        }
        view.addSubview(alertView!)
    }
    
    @objc func closeAlert () {
        alertView?.removeFromSuperview()
        alertView = nil
    }

}
