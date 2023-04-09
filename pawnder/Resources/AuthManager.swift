//
//  AuthManager.swift
//  pawnder
//
//  Created by Ninia Sabadze on 04.04.23.
//

import FirebaseAuth

public class AuthManager{
    
    static let shared = AuthManager()
    
    //MARK: -Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        /*
         1) check if username is available
         2) check if email is available
         3) create account
         4) insert account to database
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) {canCreate in
            if canCreate{
                /*
                 - Create account
                 - Insert account to databse
                 */
                
                Auth.auth().createUser(withEmail: email, password: password) {result, error in
                    guard error == nil, result != nil else{
                        //Firebase auth could not create account
                        return
                    }
                    
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) {inserted in
                        if inserted{
                            completion(true)
                            return
                        }else{
                            //failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else{
                //either username or email doesn't exist
                completion(false)
            }
            
        }
        
        
        
    }
    
    //we're using completion inside another closure and as a result scoe needs to escape
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        
        if let email = email{
            //email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
                
            }
            
        }
        else if let username = username{
            //username log in
            print(username)
        }
    }
}
