//
//  DBHelper.m
//  CheckinLibrary
//
//  Created by bhuvan khanna on 23/08/12.
//  Copyright (c) 2012 CheckinForGood. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

@synthesize context,fetchedResultsController,dbName,dbColumns,persistentStoreCoordinator;

-(void)insertIntoTable:(NSDictionary*)dictionary{
    NSManagedObject *data;
    data = [NSEntityDescription insertNewObjectForEntityForName:dbName inManagedObjectContext:[self context]];
    for(id key in dictionary) {
        [data setValue:[dictionary objectForKey:key] forKey:key];  
    }
    [self save];
}

-(void)updateFromTable:(NSManagedObject*)mObject withKey:(NSString *)key withValue:(NSString *)value {
    
    [mObject setValue:value forKey:key];
    [self save];
}

-(void)updateIntValueFromTable:(NSManagedObject*)mObject withKey:(NSString *)key withValue:(NSString *)value {
    
    [mObject setValue:value forKey:key];
    [self save];
}

-(int)isRecordPresent:(int)remoteId {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:[self context]];
    [request setEntity:entity];
    
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"remote_id = %d", remoteId];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSUInteger count = [context countForFetchRequest:request error:&error];

    return count;
}

-(void)deleteFromTable:(NSManagedObject*)mObject{
    [context deleteObject:mObject];
    [self save];
}


-(NSArray *)fetch:(int)remoteId {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:[self context]];
    [request setEntity:entity];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"remote_id = %d", remoteId];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *records = [context executeFetchRequest:request error:&error];

    return records;
}

-(NSArray *)fetchAll {
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [request setEntity:entity];
    
    [request setPredicate:nil];
    
    NSError *error = nil;
    NSArray *records = [context executeFetchRequest:request error:&error];
    
    return records;
    
}

-(void)deleteAll {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];    
    
    for (NSManagedObject *managedObject in items) {
        [context deleteObject:managedObject];
    }
    [self save];
}

-(void)deleteWithPredicate:(NSPredicate *) predicate {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items) {
        [context deleteObject:managedObject];
    }
    [self save];
}

- (NSFetchedResultsController *)fetchedResultsController{
    if (mfetchedResultsController) return mfetchedResultsController;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[dbColumns objectAtIndex:0] ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];  
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    [self setFetchedResultsController:aFetchedResultsController];
    mfetchedResultsController=aFetchedResultsController;
    
    return mfetchedResultsController;        
} 

-(NSArray*)fetchWithPredicate:(NSPredicate*)predicate {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError *error = nil;
    [request setPredicate:predicate];
    NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
    
    if ( fetchedObjects == nil ) {
        abort();
    }
    
    return fetchedObjects; 
}

-(NSArray*)fetchWithCondition:(NSPredicate*)predicate withAttributeKey:(NSString *)dbAttributeKey {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError *error = nil;
    [request setPredicate:predicate];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        
                                        initWithKey:dbAttributeKey ascending:YES];
    
    [request setSortDescriptors:@[sortDescriptor]];
    [request setFetchLimit:2];
    
    NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
    
    if ( fetchedObjects == nil ) {
        abort();
    }
    
    return fetchedObjects;
}

-(NSArray *)fetchAllDistinct:(NSString *) attributeName {

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:dbName];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:context];
    fetchRequest.resultType = NSDictionaryResultType;
    fetchRequest.propertiesToFetch = [NSArray arrayWithObject:[[entity propertiesByName] objectForKey:attributeName]];
    fetchRequest.returnsDistinctResults = YES;
    
    NSArray *dictionaries = [context executeFetchRequest:fetchRequest error:nil];
    return dictionaries;
}

-(void)startTransaction {
        //Set a flag not to save operations in the MOC
    inTransaction = YES;
}

-(void)endTransaction {
    NSError *error = nil;
    
    if ([context hasChanges] && ![context save:&error]) {
    }    
}

- (BOOL)coreDataHasEntriesForEntityName:(NSString *)entityName {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.context];
    [request setEntity:entity];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    if (!results) {
        abort();
    }
    if ([results count] == 0) {
        return NO;
    }
    return YES;
}

-(BOOL)save {
    if ( !inTransaction ) {
        NSError *error = nil;
        if (![context save:&error]) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES; 
    }
}


@end
