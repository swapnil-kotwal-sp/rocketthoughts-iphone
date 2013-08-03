//
//  CategoryDBAdapter.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "CategoryDBAdapter.h"
#import "CategoryModel.h"
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
    dbColumns = [NSArray arrayWithObjects:@"category_id",@"name",nil];
}


-(void)createRecord: (NSArray*)objects {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:dbColumns];
    [super insertIntoTable:dictionary];
}

- (NSArray *)getCategoryName {
    NSArray *category = [super fetchAll];
    NSMutableArray *categoriesList = [NSMutableArray new] ;
    for(int i=0;i<[category count];i++) {
        ModelCategory *result = [ModelCategory new];
        result.category_id = [(NSManagedObject *)[category objectAtIndex:i] valueForKey:@"category_id"];
        result.name = [(NSManagedObject *)[category objectAtIndex:i] valueForKey:@"name"];
        [categoriesList addObject:result];
    }
    return categoriesList;
}
@end
