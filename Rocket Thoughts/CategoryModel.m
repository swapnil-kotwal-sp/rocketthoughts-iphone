//
//  CategoryModel.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "CategoryModel.h"



@implementation CategoryModel

@synthesize Status;
@synthesize Count;
@synthesize Categories;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[CategoryModel alloc] initWithDictionary:dictionary];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Status = [dictionary objectForKey:@"status"];
        Count = [dictionary objectForKey:@"count"];
        
        NSArray* temp =  [dictionary objectForKey:@"categories"];
        Categories =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Categories addObject:[ModelCategory objectWithDictionary:d]];
        }
    }
    return self;
}

@end


@implementation ModelCategory

@synthesize Id;
@synthesize Slug;
@synthesize Title;
@synthesize Description;
@synthesize Parent;
@synthesize Post_count;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelCategory alloc] initWithDictionary:dictionary];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Id = [dictionary objectForKey:@"id"];
        Slug = [dictionary objectForKey:@"slug"];
        Title = [dictionary objectForKey:@"title"];
        Description = [dictionary objectForKey:@"description"];
        Parent = [dictionary objectForKey:@"parent"];
        Post_count = [dictionary objectForKey:@"post_count"];
    }
    return self;
}


@end

//JsonModel.m End
