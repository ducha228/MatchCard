//
//  AllClubViewController.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "AllClubViewController.h"

@interface AllClubViewController ()
{
    UITableView *_tableView;
    UIImageView *_backgroundImage;
}
@end

@implementation AllClubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"English Premier League"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataManager *dataManager = [DataManager new];
    
    _listTeam = [dataManager readTeam];
    
    _backgroundImage = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _backgroundImage.alpha = 0.7;
    _backgroundImage.image = [UIImage imageNamed:@"PremierLeague1.jpg"];
    
    _tableView  = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundView = _backgroundImage;
    [self.view addSubview:_tableView];
    
    NSString *source = [[NSBundle mainBundle] pathForResource:@"PremierLeague" ofType:@"mp3"
                        ];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:source] error:NULL];
    [_audioPlayer play];
    // Do any additional setup after loading the view from its nib.
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
    return [_listTeam count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Team *team = [_listTeam objectAtIndex:indexPath.row];
    cell.textLabel.text = team.teamName;
    cell.detailTextLabel.text = team.coachName;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamDetailController *teamDetail = [[TeamDetailController alloc] initWithNibName:@"TeamDetailController" bundle:nil];
    //[self presentViewController:teamDetail animated:YES completion:nil];
    UIBarButtonItem *myBarButton = [UIBarButtonItem new];
    [myBarButton setTitle:@"BackToMain"];
    
    self.navigationItem.backBarButtonItem = myBarButton;
    
    teamDetail.team = [_listTeam objectAtIndex:indexPath.row];
    [_audioPlayer stop];
    [self.navigationController pushViewController:teamDetail animated:YES];
}

@end
