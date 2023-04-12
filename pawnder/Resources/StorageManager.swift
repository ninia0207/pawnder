//
//  StorageManager.swift
//  pawnder
//
//  Created by Ninia Sabadze on 04.04.23.
//

import FirebaseStorage

public class StorageManager{
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    //MARK: - Public
    
    public func uploadUserPhotoPost(model: PhotoPost, completion: @escaping (Result<URL, Error>) -> Void){
        
    }
}

