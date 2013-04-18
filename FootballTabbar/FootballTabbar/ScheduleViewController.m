//
//  ScheduleViewController.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_listMatch;
    UIImageView *_background;
}
@end

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Schedule";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DataManager *dataManager = [DataManager new];
    _listMatch = [dataManager readMatch];
    CGRect frame = CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height, 320, 480);
    _background = [[UIImageView alloc] initWithFrame:frame];
    _background.image = [UIImage imageNamed:@"premierleague2.jpg"];
    _background.alpha = 0.8;
    
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.backgroundView = _background;
    //[self.view addSubview:_background];
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
    return [_listMatch count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Match *match = [_listMatch objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", match.teamA,match.teamB];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", match.date];

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchDetailViewController *matchDetailVC = [[MatchDetailViewController alloc] initWithNibName:@"MatchDetailViewController" bundle:nil];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backButton;
    matchDetailVC.match = [_listMatch objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:matchDetailVC animated:YES];
}
@end
