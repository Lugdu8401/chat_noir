//
//  LoadableView.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class LoadableView: UIView {

    var viewFromXib: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewFromXib = loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewFromXib = loadView()
    }
    
    func loadView () -> UIView {
        let name = String(describing: type(of: self))
        if let v = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView {
            self.addSubview(v)
            v.frame = bounds
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            return v
        }
        else
        {
            return UIView()
        }
        
    }

}
