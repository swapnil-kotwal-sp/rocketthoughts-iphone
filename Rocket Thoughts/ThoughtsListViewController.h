//
//  ThoughtsListViewController.h
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebserviceHelperClass.h"
#import "AsyncImageView.h"

@interface ThoughtsListViewController : RootViewController <UITableViewDelegate, UITableViewDataSource,WebserviceDelegate,UISearchBarDelegate> {
    IBOutlet UITableView *tableViewThoughts;
    IBOutlet UITableViewCell *tableViewCellThought;
    IBOutlet AsyncImageView *cellImageViewThought;
    IBOutlet UILabel *cellLabelThoughtName;
    IBOutlet UILabel *cellLabelThoughtDescription;
    IBOutlet UISearchBar *searchBarThoughts;
    NSMutableArray *arrayThoughts;
    WebserviceHelperClass *helperClass;
}

@property (nonatomic) BOOL isFromCategory;
@property (nonatomic) int categoryId;;

@end
