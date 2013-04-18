//
//  AllPlayerViewController.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "AllPlayerViewController.h"

@interface AllPlayerViewController ()

@end

@implementation AllPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"All Player";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    background.image = [UIImage imageNamed:@"Beckham.jpg"];
    background.alpha = 0.7;
    DataManager *dataManager = [[DataManager alloc] init];
    
    _listPlayer = [dataManager readPlayer];
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.size.height = frame.size.height - 100;
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    //_tableView.scrollEnabled = YES;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundView = background;
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listPlayer count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Player *player = [_listPlayer objectAtIndex:indexPath.row];
    cell.textLabel.text = player.playerName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",player.ownerTeam];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerDetailController *playerDetail = [[PlayerDetailController alloc] initWithNibName:@"PlayerDetailController" bundle:nil];
    
    UIBarButtonItem *myButton = [UIBarButtonItem new];
    [myButton setTitle:@"Back"];
    self.navigationItem.backBarButtonItem = myButton;
    
    playerDetail.player = [_listPlayer objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:playerDetail animated:YES];
    
}

@end
