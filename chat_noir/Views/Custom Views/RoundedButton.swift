//
//  RoundedButton.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    // Init dans le code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // Init dans le storybord
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup () {
        layer.cornerRadius = frame.height / 2
    }

}
