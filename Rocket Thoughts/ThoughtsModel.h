//
//  ThoughtsModel.h
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThoughtsModel : NSObject {
    
}
@property (nonatomic, retain) NSNumber *obj_thoughtId;
@property (nonatomic, retain) NSNumber *obj_categoryId;
@property (nonatomic, retain) NSString *obj_name;
@property (nonatomic, retain) NSString *obj_imageLink;
@property (nonatomic, retain) NSString *obj_thumbnail;
@property (nonatomic, retain) NSString *obj_thought_description;
@property (nonatomic, retain) NSString *obj_created_at;

+(NSMutableArray *)fromJson:(NSDictionary *)dictionry;
+(NSString *) stringByStrippingHTML : (NSString *)htmlString;

@end
