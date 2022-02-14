//
//  PersistanceManager.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 13/02/22.
//

import Foundation
import CoreData

class PersistanceManager {
    static let shared = PersistanceManager()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "movies_favorite")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: Save Data
    func saveToFavorite(id: Int, title: String, release_date: String, overview: String, poster: Data) {
        let movies = MoviesFavorite(context: persistentContainer.viewContext)
        movies.id_movie = Int32(id)
        movies.title = title
        movies.release_date = release_date
        movies.overview = overview
        movies.poster_image = poster
        
        save {
            print("Berhasil save")
        }
    }
    
    // MARK: Fetch Data
    func fetchMoviesFavorite() -> [MoviesFavorite] {
        let request: NSFetchRequest<MoviesFavorite> = MoviesFavorite.fetchRequest()
        
        var movies: [MoviesFavorite] = []
        
        do {
            movies = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Gagal fetching Movies favorite")
        }
        return movies
    }
    
    func fetchMoviesId(id: Int) -> Bool {
        let request: NSFetchRequest<MoviesFavorite> = MoviesFavorite.fetchRequest()
        request.predicate = NSPredicate(format: "(id_movie = %@)", NSNumber(value: id))
        
        do {
            let idMovie = try persistentContainer.viewContext.fetch(request)
            for data in idMovie {
                if data.id_movie == id {
                    return true
                }
            }
        } catch {
            print("Gagal fetching Movies favorite")
        }
        
        return false
    }
    
    
    // MARK: Delete Data
    func deleteFromFavorite(id: Int, onSuccess: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<MoviesFavorite> = MoviesFavorite.fetchRequest()
        request.predicate = NSPredicate(format: "(id_movie = %@)", NSNumber(value: id))
        
        do {
            let id = try persistentContainer.viewContext.fetch(request)
            
            for data in id {
                self.persistentContainer.viewContext.delete(data)
            }
        } catch {
            print("Gagal hapus")
        }
        
        save {
            onSuccess(true)
        }
    }
    
    
    // MARK: Save
    func save(onSuccess: @escaping () -> Void) {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
                onSuccess()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
