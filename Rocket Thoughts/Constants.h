//
//  Constants.h
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//

#ifndef Rocket_Thoughts_Constants_h
#define Rocket_Thoughts_Constants_h
#endif

#define IS_WIDESCREEN       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define APPDLEGATE          ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define BASE_URL            @"http://rocketthoughts-sdemo.rhcloud.com/"
#define GET_CATEGORY        BASE_URL  @"?json=get_category_index"
#define GET_THOUGHTS        BASE_URL  @"?json=get_recent_posts&count=20"
#define SEARCH_THOUGHTS     BASE_URL  @"http://rocketthoughts-sdemo.rhcloud.com/?json=get_search_results&count=20"
