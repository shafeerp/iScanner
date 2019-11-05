//
//  CoreDataManager.swift
//  iScanner
//
//  Created by Shafeer P on 05/11/19.
//  Copyright © 2019 Shafeer P. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static func addNewData(_ datum: IScannerScannedDatum) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let scannedEntity = NSEntityDescription.entity(forEntityName: IScannerConstants.IScannerStorage.ScannedDataEntity, in: managedContext) else { return }
        let entityInstance = NSManagedObject(entity: scannedEntity, insertInto: managedContext)
        entityInstance.setValue(datum.text, forKey: IScannerConstants.IScannerStorage.TextAttribute)
        
        do {
            try managedContext.save()
        }
        catch(let error) {
            print(error, "Unable to save")
        }
    }
    
    static func retreaveScannedData() -> [IScannerScannedDatum] {
        var scannedDatum : [IScannerScannedDatum] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return scannedDatum}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: IScannerConstants.IScannerStorage.ScannedDataEntity)
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else { return scannedDatum }
            result.forEach{ scannedDatum.append(IScannerScannedDatum(id: $0.objectID, text: $0.value(forKey: IScannerConstants.IScannerStorage.TextAttribute) as? String ?? ""))}
            
            
        }catch (let error) {
            print("Unable to retreave",error)
        }
        
        return scannedDatum
        
    }
    
    static func deleteData(_ id : NSManagedObjectID){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: IScannerConstants.IScannerStorage.ScannedDataEntity)
        
        do{
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else { return }
            
            result.forEach{ if $0.objectID == id {
                managedContext.delete($0)
                print("deleted",$0)
            }}
            try managedContext.save()
        }
        catch
        {
            print(error, "Unable to Delete")
        }
    }
}
