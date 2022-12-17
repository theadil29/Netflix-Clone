//
//  DataPresistenceManager.swift
//  Netflix Clone
//
//  Created by MD Adil on 01/08/22.
//

import Foundation
import UIKit
import CoreData

class DataPresistenceManager {
    
    static let shared = DataPresistenceManager()
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
       
        
        do{
            try context.save()
            completion(.success(()))
        }
        catch{
            completion(.failure(DatabaseError.failedToSaveData))
        }
        
    }
    
    func fetchingTitleFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        do{
            
            let titles = try context.fetch(request)
            completion(.success(titles))
        }
        catch{
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model) // asking the database manager to delete certain object
        
        do{
            try context.save()
            completion(.success(()))
        }
        catch{
            completion(.failure(DatabaseError.failedToDeleteData))
        }
        
    }
}
