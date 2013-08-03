//
//  ThoughtDetailViewController.h
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThoughtsModel.h"
#import "AsyncImageView.h"

@interface ThoughtDetailViewController : UIViewController {
    IBOutlet UILabel *labelThoughtTitle;
    IBOutlet UILabel *labelThoughtDescription;
    IBOutlet AsyncImageView *imageViewThought;
    IBOutlet UIScrollView *scrollView;
}
@property (nonatomic, retain) ThoughtsModel *thoughtsModel;

@end
