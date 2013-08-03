//
//  ThoughtModel.h
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//


#import "ThoughtsModel.h"
#import <Foundation/Foundation.h>


@class ModelCategory;
@class ModelAuthor;
@class ModelCustom_fields;
@class ModelFull;
@class ModelThumbnail;
@class ModelMedium;
@class ModelLarge;
@class ModelPostThumbnail;
@class ModelThumbnail_images;
@class ModelPost;

@interface ThoughtsModel : NSObject
{
    NSString * Status;
    NSNumber * Count;
    NSNumber * Count_total;
    NSNumber * Pages;
    NSMutableArray * Posts;
}

@property(nonatomic,retain) NSString * Status;
@property(nonatomic,retain) NSNumber * Count;
@property(nonatomic,retain) NSNumber * Count_total;
@property(nonatomic,retain) NSNumber * Pages;
@property(nonatomic,retain) NSMutableArray * Posts;

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


@interface ModelAuthor : NSObject
{
    NSNumber * Id;
    NSString * Slug;
    NSString * Name;
    NSString * First_name;
    NSString * Last_name;
    NSString * Nickname;
    NSString * Url;
    NSString * Description;
}

@property(nonatomic,retain) NSNumber * Id;
@property(nonatomic,retain) NSString * Slug;
@property(nonatomic,retain) NSString * Name;
@property(nonatomic,retain) NSString * First_name;
@property(nonatomic,retain) NSString * Last_name;
@property(nonatomic,retain) NSString * Nickname;
@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSString * Description;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelCustom_fields : NSObject
{
}


+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelFull : NSObject
{
    NSString * Url;
    NSNumber * Width;
    NSNumber * Height;
}

@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSNumber * Width;
@property(nonatomic,retain) NSNumber * Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelThumbnail : NSObject
{
    NSString * Url;
    NSNumber * Width;
    NSNumber * Height;
}

@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSNumber * Width;
@property(nonatomic,retain) NSNumber * Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelMedium : NSObject
{
    NSString * Url;
    NSNumber * Width;
    NSNumber * Height;
}

@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSNumber * Width;
@property(nonatomic,retain) NSNumber * Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelLarge : NSObject
{
    NSString * Url;
    NSNumber * Width;
    NSNumber * Height;
}

@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSNumber * Width;
@property(nonatomic,retain) NSNumber * Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelPostThumbnail : NSObject
{
    NSString * Url;
    NSNumber * Width;
    NSNumber * Height;
}

@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSNumber * Width;
@property(nonatomic,retain) NSNumber * Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelThumbnail_images : NSObject
{
    ModelFull * Full;
    ModelThumbnail * Thumbnail;
    ModelMedium * Medium;
    ModelLarge * Large;
    ModelPostThumbnail * PostThumbnail;
}

@property(nonatomic,retain) ModelFull * Full;
@property(nonatomic,retain) ModelThumbnail * Thumbnail;
@property(nonatomic,retain) ModelMedium * Medium;
@property(nonatomic,retain) ModelLarge * Large;
@property(nonatomic,retain) ModelPostThumbnail * PostThumbnail;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface ModelPost : NSObject
{
    NSNumber * Id;
    NSString * Type;
    NSString * Slug;
    NSString * Url;
    NSString * Status;
    NSString * Title;
    NSString * Title_plain;
    NSString * Content;
    NSString * Excerpt;
    NSString * Date;
    NSString * Modified;
    NSMutableArray * Categories;
    NSMutableArray * Tags;
    ModelAuthor * Author;
    NSMutableArray * Comments;
    NSMutableArray * Attachments;
    NSNumber * Comment_count;
    NSString * Comment_status;
    NSString * Thumbnail;
    ModelCustom_fields * Custom_fields;
    NSString * Thumbnail_size;
    ModelThumbnail_images * Thumbnail_images;
}

@property(nonatomic,retain) NSNumber * Id;
@property(nonatomic,retain) NSString * Type;
@property(nonatomic,retain) NSString * Slug;
@property(nonatomic,retain) NSString * Url;
@property(nonatomic,retain) NSString * Status;
@property(nonatomic,retain) NSString * Title;
@property(nonatomic,retain) NSString * Title_plain;
@property(nonatomic,retain) NSString * Content;
@property(nonatomic,retain) NSString * Excerpt;
@property(nonatomic,retain) NSString * Date;
@property(nonatomic,retain) NSString * Modified;
@property(nonatomic,retain) NSMutableArray * Categories;
@property(nonatomic,retain) NSMutableArray * Tags;
@property(nonatomic,retain) ModelAuthor * Author;
@property(nonatomic,retain) NSMutableArray * Comments;
@property(nonatomic,retain) NSMutableArray * Attachments;
@property(nonatomic,retain) NSNumber * Comment_count;
@property(nonatomic,retain) NSString * Comment_status;
@property(nonatomic,retain) NSString * Thumbnail;
@property(nonatomic,retain) ModelCustom_fields * Custom_fields;
@property(nonatomic,retain) NSString * Thumbnail_size;
@property(nonatomic,retain) ModelThumbnail_images * Thumbnail_images;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end