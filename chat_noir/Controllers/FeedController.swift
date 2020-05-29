//
//  FeedController.swift
//  chat_noir
//
//  Created by David Grammatico on 27/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class FeedController: UIViewController {

    
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var pencilBtn: UIButton!
    @IBOutlet weak var notifBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var gearsBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    var isMenuOpen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func closeMenu () {
        
    }
    
    func openMenu () {
        menuBtn.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            print(self.menuView.frame)
            self.menuView.frame = CGRect(x: 20, y: self.menuView.frame.minY, width: self.view.frame.width - 40, height: 50)
            print(self.menuView.frame)
        }) { (success) in
            self.menuBtn.center.x = self.menuView.center.x - 21
            print(self.menuBtn.center.x)
            print(self.menuView.center.x)
            UIView.animate(withDuration: 0.25, animations: {
                self.menuBtn.alpha = 1
                self.menuBtn.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            }) { (success) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.menuBtn.transform = CGAffineTransform.identity
                }) { (success) in
                    
                }
            }
        }
    }

    
    @IBAction func segmentedPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func menuPressed(_ sender: UIButton) {
        isMenuOpen ? closeMenu() : openMenu()
    }
    
    
}
