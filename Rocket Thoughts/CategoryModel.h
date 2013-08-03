//
//  CategoryModel.h
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//


#import <Foundation/Foundation.h>


@class ModelCategory;

@interface CategoryModel : NSObject
{
    NSString * Status;
    NSNumber * Count;
    NSMutableArray * Categories;
}

@property(nonatomic,retain) NSString * Status;
@property(nonatomic,retain) NSNumber * Count;
@property(nonatomic,retain) NSMutableArray * Categories;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelCategory : NSObject
{
    NSNumber * Id;
    NSString * Slug;
    NSString * Title;
    NSString * Description;
    NSNumber * Parent;
    NSNumber * Post_count;
}

@property(nonatomic,retain) NSNumber * Id;
@property(nonatomic,retain) NSString * Slug;
@property(nonatomic,retain) NSString * Title;
@property(nonatomic,retain) NSString * Description;
@property(nonatomic,retain) NSNumber * Parent;
@property(nonatomic,retain) NSNumber * Post_count;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


