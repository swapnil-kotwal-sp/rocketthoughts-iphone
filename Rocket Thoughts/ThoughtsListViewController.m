//
//  ThoughtsListViewController.m
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "ThoughtsListViewController.h"
#import "ThoughtDetailViewController.h"

@interface ThoughtsListViewController ()

@end

@implementation ThoughtsListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayThoughts = [[NSMutableArray alloc] init];
    [self loadThoughts:@"1"];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadThoughts:(NSString *)pageNumber {
    WebserviceHelperClass *helperClass = [[WebserviceHelperClass alloc] init];
    helperClass.showLoadingView = YES;
    helperClass.loadingViewText = @"Loading thoughts..";
    helperClass.delegate = self;
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:pageNumber forKey:@"page"];
    [helperClass callWebServiceForGETRequest:GET_THOUGHTS withParameters:dictionary withServiceTag:0];
}

-(void)searchThoughts:(NSString *)searchString withPageNumber:(NSString *)pageNumber {
    WebserviceHelperClass *helperClass = [[WebserviceHelperClass alloc] init];
    helperClass.showLoadingView = YES;
    helperClass.loadingViewText = @"Loading thoughts..";
    helperClass.delegate = self;
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:pageNumber forKey:@"page"];
    [dictionary setObject:searchString forKey:@"search"];
    [helperClass callWebServiceForGETRequest:SEARCH_THOUGHTS withParameters:dictionary withServiceTag:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate and datasource methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayThoughts count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 102;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ThoughtDetailViewController *thoughtDetailViewController = [[ThoughtDetailViewController alloc] initWithNibName:@"ThoughtDetailViewController" bundle:nil];
    [self.navigationController pushViewController:thoughtDetailViewController animated:YES];
}

#pragma mark - Search delegate methods 
/*Search Bar Text Did Begin Editing*/
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

/*Search Bar Text Did End Editing*/
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
}
/*Search Bar Cancel Button Clicked*/
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBarThoughts resignFirstResponder];
    [searchBarThoughts setText:@""];
}
/*Search Bar Search Button Clicked*/

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBarThoughts resignFirstResponder];
    [self searchThoughts:searchBarThoughts.text withPageNumber:@"1"];
}

#pragma mark - Webservice Delegate methods
-(void) apiCallResponse:(id)response andServiceTag:(int)tag {
    switch (tag) {
        case 0:
             NSLog(@"Thought Response: %@",response);
            break;
        
        case 1:
             NSLog(@"Search Thought Response: %@",response);
            break;
            
        default:
            break;
    }   
}

-(void) apiCallError:(NSError *)error andServiceTag:(int)tag {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request time out" message:@"Check your internet connectivity" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

@end
