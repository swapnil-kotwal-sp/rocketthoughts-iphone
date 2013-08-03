//
//  ThoughtModel.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "ThoughtsModel.h"
#import <Foundation/Foundation.h>


@implementation ThoughtsModel

@synthesize Status;
@synthesize Count;
@synthesize Count_total;
@synthesize Pages;
@synthesize Posts;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ThoughtsModel alloc] initWithDictionary:dictionary];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Status = [dictionary objectForKey:@"status"];
        Count = [dictionary objectForKey:@"count"];
        Count_total = [dictionary objectForKey:@"count_total"];
        Pages = [dictionary objectForKey:@"pages"];
        
        NSArray* temp =  [dictionary objectForKey:@"posts"];
        Posts =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Posts addObject:[ModelPost objectWithDictionary:d]];
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


@implementation ModelAuthor

@synthesize Id;
@synthesize Slug;
@synthesize Name;
@synthesize First_name;
@synthesize Last_name;
@synthesize Nickname;
@synthesize Url;
@synthesize Description;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelAuthor alloc] initWithDictionary:dictionary];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Id = [dictionary objectForKey:@"id"];
        Slug = [dictionary objectForKey:@"slug"];
        Name = [dictionary objectForKey:@"name"];
        First_name = [dictionary objectForKey:@"first_name"];
        Last_name = [dictionary objectForKey:@"last_name"];
        Nickname = [dictionary objectForKey:@"nickname"];
        Url = [dictionary objectForKey:@"url"];
        Description = [dictionary objectForKey:@"description"];
    }
    return self;
}


@end


@implementation ModelCustom_fields


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelCustom_fields alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
    }
    return self;
}


@end


@implementation ModelFull

@synthesize Url;
@synthesize Width;
@synthesize Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelFull alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Url = [dictionary objectForKey:@"url"];
        Width = [dictionary objectForKey:@"width"];
        Height = [dictionary objectForKey:@"height"];
    }
    return self;
}


@end


@implementation ModelThumbnail

@synthesize Url;
@synthesize Width;
@synthesize Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj =[[ModelThumbnail alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Url = [dictionary objectForKey:@"url"];
        Width = [dictionary objectForKey:@"width"];
        Height = [dictionary objectForKey:@"height"];
    }
    return self;
}


@end


@implementation ModelMedium

@synthesize Url;
@synthesize Width;
@synthesize Height;

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelMedium alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Url = [dictionary objectForKey:@"url"];
        Width = [dictionary objectForKey:@"width"];
        Height = [dictionary objectForKey:@"height"];
    }
    return self;
}


@end


@implementation ModelLarge

@synthesize Url;
@synthesize Width;
@synthesize Height;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelLarge alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Url = [dictionary objectForKey:@"url"];
        Width = [dictionary objectForKey:@"width"];
        Height = [dictionary objectForKey:@"height"];
    }
    return self;
}


@end


@implementation ModelPostThumbnail

@synthesize Url;
@synthesize Width;
@synthesize Height;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelPostThumbnail alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Url = [dictionary objectForKey:@"url"];
        Width = [dictionary objectForKey:@"width"];
        Height = [dictionary objectForKey:@"height"];
    }
    return self;
}


@end


@implementation ModelThumbnail_images

@synthesize Full;
@synthesize Thumbnail;
@synthesize Medium;
@synthesize Large;
@synthesize PostThumbnail;


+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelThumbnail_images alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        
        Full = [[ModelFull alloc] initWithDictionary:[dictionary objectForKey:@"full"]];
        
        Thumbnail = [[ModelThumbnail alloc] initWithDictionary:[dictionary objectForKey:@"thumbnail"]];
        
        Medium = [[ModelMedium alloc] initWithDictionary:[dictionary objectForKey:@"medium"]];
        
        Large = [[ModelLarge alloc] initWithDictionary:[dictionary objectForKey:@"large"]];
        
        PostThumbnail = [[ModelPostThumbnail alloc] initWithDictionary:[dictionary objectForKey:@"postThumbnail"]];
    }
    return self;
}


@end


@implementation ModelPost

@synthesize Id;
@synthesize Type;
@synthesize Slug;
@synthesize Url;
@synthesize Status;
@synthesize Title;
@synthesize Title_plain;
@synthesize Content;
@synthesize Excerpt;
@synthesize Date;
@synthesize Modified;
@synthesize Categories;
@synthesize Tags;
@synthesize Author;
@synthesize Comments;
@synthesize Attachments;
@synthesize Comment_count;
@synthesize Comment_status;
@synthesize Thumbnail;
@synthesize Custom_fields;
@synthesize Thumbnail_size;
@synthesize Thumbnail_images;

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[ModelPost alloc] initWithDictionary:dictionary] ;
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Id = [dictionary objectForKey:@"id"];
        Type = [dictionary objectForKey:@"type"];
        Slug = [dictionary objectForKey:@"slug"];
        Url = [dictionary objectForKey:@"url"];
        Status = [dictionary objectForKey:@"status"];
        Title = [dictionary objectForKey:@"title"];
        Title_plain = [dictionary objectForKey:@"title_plain"];
        Content = [dictionary objectForKey:@"content"];
        Excerpt = [dictionary objectForKey:@"excerpt"];
        Date = [dictionary objectForKey:@"date"];
        Modified = [dictionary objectForKey:@"modified"];
        
        NSArray* temp =  [dictionary objectForKey:@"categories"];
        Categories =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Categories addObject:[ModelCategory objectWithDictionary:d]];
        }
        
        temp =  [dictionary objectForKey:@"tags"];
        Tags =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Tags addObject:d];
        }
        
        Author = [[ModelAuthor alloc] initWithDictionary:[dictionary objectForKey:@"author"]];
        
        temp =  [dictionary objectForKey:@"comments"];
        Comments =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Comments addObject:d];
        }
        
        temp =  [dictionary objectForKey:@"attachments"];
        Attachments =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Attachments addObject:d];
        }
        Comment_count = [dictionary objectForKey:@"comment_count"];
        Comment_status = [dictionary objectForKey:@"comment_status"];
        Thumbnail = [dictionary objectForKey:@"thumbnail"];
        
        Custom_fields = [[ModelCustom_fields alloc] initWithDictionary:[dictionary objectForKey:@"custom_fields"]];
        Thumbnail_size = [dictionary objectForKey:@"thumbnail_size"];
        
        Thumbnail_images = [[ModelThumbnail_images alloc] initWithDictionary:[dictionary objectForKey:@"thumbnail_images"]];
    }
    return self;
}


@end

