//
//  FireAuth.swift
//  chat_noir
//
//  Created by David Grammatico on 26/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import Foundation
import Firebase

class FireAuth {
    
    let auth = Auth.auth()
    var completion: ((_ uid: String?, _ error: String?) -> Void)?
    var name: String?
    var surname: String?
    
    // Est-ce que l'utilisateur est authentifié
    func isAuth () -> Bool {
        return auth.currentUser?.uid != nil
    }
    
    func signIn (_ mail: String, _ pwd: String, completion: ((_ uid: String?, _ error: String?) -> Void)?) {
        self.completion = completion
        auth.signIn(withEmail: mail, password: pwd, completion: handleResult(_:_:))
    }
    
    func createUser (_ mail: String, _ pwd: String, completion: ((_ uid: String?, _ error: String?) -> Void)?) {
        self.completion = completion
        auth.createUser(withEmail: mail, password: pwd, completion: handleResult(_:_:))
    }
    
    func signOut () {
        
    }
    
    func handleResult (_ data: AuthDataResult?, _ error: Error?) {
        if error != nil {
            self.completion?(nil, error!.localizedDescription)
        }
        if let uid = data?.user.uid {
            self.completion?(uid, nil)
        }
    }
    
}
