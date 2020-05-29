//
//  FireDatabase.swift
//  chat_noir
//
//  Created by David Grammatico on 27/05/2020.
//  Copyright © 2020 devaidaya. All rights reserved.
//

import Firebase
import  UIKit

class FireDatabase {
    
    let base = Firestore.firestore()
    var usersCollection: CollectionReference {
        return base.collection("users")
    }
    
    var postsCollection: CollectionReference {
        return base.collection("posts")
    }
    
    func addUser (_ uid: String, data: [String: Any]) {
        usersCollection.document(uid).setData(data)
    }
    
}

