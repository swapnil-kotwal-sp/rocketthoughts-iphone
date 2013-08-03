//
//  CategoryViewController.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryModel.h"
#import "CategoryDBAdapter.h"
#import "ThoughtsListViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController
@synthesize arrCategory,tblCategory,arrayCategoryList;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayCategoryList = [[NSMutableArray alloc] init];
    NSArray *controllers = self.navigationController.viewControllers;
    NSLog(@"this is controller-->%@",controllers);
    arrCategory = [NSMutableArray new];
    WebserviceHelperClass *helper =  [[WebserviceHelperClass alloc]init];
    helper.delegate =self;
    helper.showLoadingView = YES;
    helper.loadingViewText = @"Loading...Please wait";
    [helper callWebServiceForPOSTRequest:GET_CATEGORY withParameters:nil withServiceTag:0];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrCategory count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
        cell.textLabel.text = [arrCategory objectAtIndex:indexPath.row]; // only top row showing
        //cell.imageView.image = [UIImage imageNamed:@"timings-icon"];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelCategory *categoryModel = [arrayCategoryList objectAtIndex:indexPath.row];
    ThoughtsListViewController *thoughtsListViewController = [[ThoughtsListViewController alloc] initWithNibName:@"ThoughtsListViewController" bundle:nil];
    thoughtsListViewController.categoryId = [categoryModel.category_id intValue];
    thoughtsListViewController.isFromCategory = YES;
    [self.navigationController pushViewController:thoughtsListViewController animated:YES];
}

#pragma mark - Webservice Delegate

- (void)apiCallResponse:(id)response andServiceTag:(int)tag {
    NSLog(@"this is list of category-->%@",response);
    CategoryDBAdapter *adapter = [[CategoryDBAdapter alloc] init:APPDLEGATE.managedObjectContext];
    CategoryModel *model= [[CategoryModel alloc]initWithDictionary:(NSDictionary *)response];
    arrayCategoryList = model.Categories;
       [adapter deleteAll];
    for (ModelCategory *model in arrayCategoryList) {
        [adapter createRecord:[NSArray arrayWithObjects:model.category_id,model.name,nil]];
    }
    NSArray * arr = [adapter getCategoryName];
    for (ModelCategory *db in arr) {
        [arrCategory addObject:db.name];
    }
    [self.tblCategory reloadData];
}


- (void)apiCallError:(NSError *)error andServiceTag:(int)tag {

}



@end
