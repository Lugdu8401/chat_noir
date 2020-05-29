//
//  LogController.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import UIKit

class LogController: RootController {

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var mailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var surnameTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upadeVisible(false, mailTf)
        upadeVisible(false, passwordTf)
        upadeVisible(false, surnameTf)
        upadeVisible(false, nameTf)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    func setupUI () {
        if FireAuth().isAuth() {
            // Partir si la seconde page
            toMain()
        }
        else
        {
            // L'ulisateur s'authentifie
            upadeVisible(true, mailTf)
            upadeVisible(true, passwordTf)
            let bool = segmented.selectedSegmentIndex != 0
            upadeVisible(bool, surnameTf)
            upadeVisible(bool, nameTf)
        }
    }
    
    func upadeVisible ( _ bool: Bool, _ view: UIView) {
        view.isHidden = !bool
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func validateBtn(_ sender: UIButton) {
        if let mail = mailTf.text, mail != "" {
            if let pwd = passwordTf.text, pwd != "" {
                if segmented.selectedSegmentIndex == 0 {
                    // Authentification
                    FireAuth().signIn(mail, pwd) { (uid, error) in
                        if error != nil {
                            self.showAlert(error, .error)
                        }
                        if uid != nil {
                            // Envoyer vers le controller suivant
                            self.toMain()
                        }
                    }
                }
                else
                {
                    if let surname = surnameTf.text, surname != "" {
                        if let name = nameTf.text, name != "" {
                            // Création de compte
                            FireAuth().createUser(mail, pwd) { (uid, error) in
                                if error != nil {
                                    self.showAlert(error, .error)
                                }
                                if uid != nil {
                                    let data: [String:Any] = [KEY_NAME:name, KEY_SURNAME:surname, KEY_UID:uid,
                                    ]
                                    FireDatabase().addUser(uid!, data: data)
                                    self.toMain()
                                }
                            }
                        }
                        else
                        {
                            // Alert, pas de nom
                            showAlert(errorEmpty("nom"), .error)
                        }
                    }
                    else
                    {
                        // Alert, pas de prénom
                        showAlert(errorEmpty("prénom"), .error)
                    }
                }
            }
            else
            {
                // Alert, pas de mot de passe
                showAlert(errorEmpty("mot de passe"), .error)
            }
        }
        else
        {
            // Alert, pas de mail
            showAlert(errorEmpty("adresse mail"), .error)
        }
    }
    
    
    func toMain () {
        performSegue(withIdentifier: SEGUE_APP, sender: nil)
    }
    
    @IBAction func segmentedChanged(_ sender: Any) {
        setupUI()
    }
}
