//
//  CategoryDBAdapter.h
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "DBHelper.h"

@interface CategoryDBAdapter : DBHelper
- (id)init:(NSManagedObjectContext *)managedContext;
-(void)createRecord: (NSArray*)objects;
- (NSArray *)getCategoryName ;
@end
