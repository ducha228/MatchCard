//
//  PlayerViewController.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Player View";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _background = [[UIImageView alloc] initWithFrame:CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height, 320, 480)];
    _background.image = [UIImage imageNamed:@"WayneRooney.jpg"];
    _background.alpha = 0.7;
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.scrollEnabled = YES;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundView = _background;
    _tableView.backgroundColor = [UIColor clearColor];
    
    //[self.view addSubview:_background];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"All Player";
    } else if(indexPath.row == 1) {
        cell.textLabel.text = @"Player In Club";
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        AllPlayerViewController *allPlayer = [[AllPlayerViewController alloc] initWithNibName:@"AllPlayerViewController" bundle:nil];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:allPlayer animated:YES];
    } else if(indexPath.row == 1) {
        AllClubViewController *allClub = [[AllClubViewController alloc] initWithNibName:@"AllClubViewController" bundle:nil];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:allClub animated:YES];
    }
}
@end
