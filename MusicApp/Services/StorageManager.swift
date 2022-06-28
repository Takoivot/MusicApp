//
//  StorageManager.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 28.06.2022.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MusicApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {}
    
    func fetchData(completion: ([Track]) -> Void) {
        let fetchRequest = Track.fetchRequest()
        
        do {
            let taskList = try context.fetch(fetchRequest)
            completion(taskList)
        } catch let error {
            print("Failed to fetch data", error)
        }
    }
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
    }
    
    func save(artistName: String, songName: String, artwork: String, preview: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Track", in: context) else { return }
        guard let track = NSManagedObject(entity: entityDescription, insertInto: context) as? Track else { return }
        track.artistName = artistName
        track.trackName = songName
        track.artworkUrl60 = artwork
        track.previewUrl = preview
        saveContext()
    }
    
    func delete(_ track: Track) {
        context.delete(track)
        saveContext()
    }
}
