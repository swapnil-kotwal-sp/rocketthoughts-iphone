//
//  DBHelper.h
//  CheckinLibrary
//
//  Created by bhuvan khanna on 23/08/12.
//  Copyright (c) 2012 CheckinForGood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DBHelper : NSObject {
    NSManagedObjectContext *context;
    NSFetchedResultsController *mfetchedResultsController;
    NSString *dbName;
    NSArray *dbColumns;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    BOOL inTransaction;
}

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSArray *dbColumns;
@property (nonatomic, retain)  NSString *dbName;
@property (nonatomic, retain)  NSPersistentStoreCoordinator *persistentStoreCoordinator;


-(void)insertIntoTable:(NSDictionary*)dictionary;
- (NSFetchedResultsController *)fetchedResultsController;
-(void)deleteFromTable:(NSManagedObject*)mObject;
-(NSArray *)fetch:(int)remoteId;
-(NSArray *)fetchAll;
-(void)deleteAll;
-(NSArray*)fetchWithPredicate:(NSPredicate*)predicate;
-(void)updateFromTable:(NSManagedObject*)mObject withKey:(NSString *)key withValue:(NSString *)value;
-(BOOL)save;
-(void)startTransaction;
-(void)endTransaction;
-(void)updateIntValueFromTable:(NSManagedObject*)mObject withKey:(NSString *)key withValue:(NSString *)value;
-(NSArray*)fetchWithCondition:(NSPredicate*)predicate withAttributeKey:(NSString *)dbAttributeKey;
- (BOOL)coreDataHasEntriesForEntityName:(NSString *)entityName;
-(int)isRecordPresent:(int)remoteId;
-(void)deleteWithPredicate:(NSPredicate *) predicate;
-(NSArray *)fetchAllDistinct:(NSString *) attributeName;

@end
