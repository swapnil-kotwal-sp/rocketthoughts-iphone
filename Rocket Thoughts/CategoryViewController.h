//
//  CategoryViewController.h
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : RootViewController <UITableViewDelegate,UITableViewDataSource,WebserviceDelegate>

@property (nonatomic,retain) NSMutableArray *arrCategory;
@property (nonatomic,retain) NSMutableArray *arrayCategoryList;
@property (nonatomic,retain) IBOutlet UITableView *tblCategory;
@end
