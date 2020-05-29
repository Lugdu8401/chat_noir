//
//  NotificationCenter.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class MyNotifCenter {
    
    let notif = NotificationCenter.default
    
    func post (_ name: String, _ userInfos: [AnyHashable: Any]?) {
        notif.post(name: Notification.Name(name), object: nil, userInfo: userInfos)
    }
    
    func receiveNotif (_ name: String, _ observer: UIViewController, _ action: Selector) {
        notif.addObserver(observer, selector: action, name: Notification.Name(name), object: nil)
    }
}
