//
//  ViewController.m
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self) {
        self.title = @"Danh sach truyen co tich";
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _taleNameArray = [[NSMutableArray alloc] initWithObjects:@"Cay khe", @"Tri khon cua ta day", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDatasource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_taleNameArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_taleNameArray objectAtIndex:indexPath.row];

    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaleDetailViewController *taleDetailVC = [[TaleDetailViewController alloc] initWithNibName:@"TaleDetailViewController" bundle:nil];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Danh sach";
    self.navigationItem.backBarButtonItem = backButton;
    
    NSString *taleName = [_taleNameArray objectAtIndex:indexPath.row];
    
    Tale *tale = [[Tale alloc] initWithName:taleName];
    taleDetailVC.tale = tale;
    
    [self.navigationController pushViewController:taleDetailVC animated:YES];
    
}
@end
