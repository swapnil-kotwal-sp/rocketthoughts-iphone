//
//  ThoughtsDBAdapter.m
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "ThoughtsDBAdapter.h"

@implementation ThoughtsDBAdapter

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
    dbName = @"Thoughts";
}

-(void)setDbColumns {
    dbColumns = [NSArray arrayWithObjects:nil];
}

-(void)createRecord: (NSArray*)objects {
    NSArray *keys = [[NSArray alloc] initWithObjects: nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    [super insertIntoTable:dictionary];
    keys = nil;
}

@end
