//
//  CategoryDBAdapter.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "CategoryDBAdapter.h"

@implementation CategoryDBAdapter

- (id)init:(NSManagedObjectContext *)managedContext
{
    self = [super init];
    if (self) {
        super.context=managedContext;
        [self setDbName];
        [self setDbColumns];
    }
    
    return self;
}

-(void)setDbName {
    dbName = @"Categories";
}

-(void)setDbColumns {
    dbColumns = [NSArray arrayWithObjects:@"id",@"name",nil];
}

-(void)createRecord: (NSArray*)objects {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:dbColumns];
    [super insertIntoTable:dictionary];
}

@end
