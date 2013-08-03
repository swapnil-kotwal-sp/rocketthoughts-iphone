//
//  ThoughtDetailViewController.m
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "ThoughtDetailViewController.h"

@interface ThoughtDetailViewController ()

@end

@implementation ThoughtDetailViewController
@synthesize thoughtsModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    labelThoughtTitle.text = thoughtsModel.obj_name;
    [labelThoughtTitle sizeToFit];
    [imageViewThought setFrame:CGRectMake(imageViewThought.frame.origin.x, labelThoughtTitle.frame.origin.y+labelThoughtTitle.frame.size.height+5, imageViewThought.frame.size.width, imageViewThought.frame.size.height)];
    
    if (thoughtsModel.obj_imageLink != nil) {
        imageViewThought.imageURL = [NSURL URLWithString:thoughtsModel.obj_imageLink];
    }
    
    [labelThoughtDescription setFrame:CGRectMake(labelThoughtDescription.frame.origin.x, imageViewThought.frame.origin.y+imageViewThought.frame.size.height+10, labelThoughtDescription.frame.size.width, labelThoughtDescription.frame.size.height)];
    labelThoughtDescription.text = thoughtsModel.obj_thought_description;
    [labelThoughtDescription sizeToFit];
    [scrollView setContentSize:CGSizeMake(320, labelThoughtDescription.frame.origin.y+labelThoughtDescription.frame.size.height+100)];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
