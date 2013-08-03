//
//  ThoughtsModel.m
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "ThoughtsModel.h"

@implementation ThoughtsModel
@synthesize obj_categoryId, obj_created_at, obj_imageLink, obj_name, obj_thought_description, obj_thoughtId, obj_thumbnail;

+(NSMutableArray *)fromJson:(NSDictionary *)dictionry {
    NSMutableArray *arrayThoughts = [[NSMutableArray alloc] init];
    NSArray *arrayPosts = [dictionry objectForKey:@"posts"];
    for (NSDictionary *dictPost in arrayPosts) {
        ThoughtsModel *thoughtModel = [[ThoughtsModel alloc] init];
        thoughtModel.obj_thought_description= [self stringByStrippingHTML:[dictPost objectForKey:@"content"]];
        thoughtModel.obj_thoughtId = [dictPost objectForKey:@"id"];
        thoughtModel.obj_name = [dictPost objectForKey:@"title"];
        thoughtModel.obj_created_at = [dictPost objectForKey:@"date"];
        NSArray *arrayAttachments = [dictPost objectForKey:@"attachments"];
        if ([arrayAttachments count] != 0) {
            NSDictionary *dictAttachments = [arrayAttachments objectAtIndex:0];
            thoughtModel.obj_imageLink = [[[dictAttachments objectForKey:@"images"] objectForKey:@"full"] objectForKey:@"url"];
            thoughtModel.obj_thumbnail = [[[dictAttachments objectForKey:@"images"] objectForKey:@"thumbnail"] objectForKey:@"url"];
        }
        [arrayThoughts addObject:thoughtModel];
    }
    return arrayThoughts;
}

+(NSString *) stringByStrippingHTML : (NSString *)htmlString {
    NSRange r;
    while ((r = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:r withString:@""];
    return htmlString;
}

@end
