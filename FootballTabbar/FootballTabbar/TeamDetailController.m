//
//  TeamDetailController.m
//  FootballManager
//
//  Created by DucHa on 4/13/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "TeamDetailController.h"

@interface TeamDetailController ()

@end

@implementation TeamDetailController

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
    // Do any additional setup after loading the view from its nib.
    [self setTitle:_team.teamName];
    _logoView = [UIImageView new];
    _logoView.frame = CGRectMake(239, 0, 80, 80);
    _logoView.backgroundColor = [UIColor blackColor];
    _logoView.image = [UIImage imageNamed:_team.logoName];
    
    NSInteger x = 0;
    NSInteger y = 0;
    _labelCoach = [[UILabel alloc] initWithFrame:CGRectMake(x, y, 80, 30)];
    _labelStadium = [[UILabel alloc] initWithFrame:CGRectMake(x, y + 40, 80, 30)];
    
    _displayCoach = [[UILabel alloc] initWithFrame:CGRectMake(x + 80, y, 150, 30)];
    _displayStadium = [[UILabel alloc] initWithFrame:CGRectMake(x + 80, y + 40, 150, 30)];
    
    _labelCoach.text = @"Coach";
    _labelCoach.textColor = [UIColor redColor];
    _labelCoach.backgroundColor = [UIColor clearColor];
    _labelStadium.text = @"Stadium";
    _labelStadium.textColor = [UIColor redColor];
    _labelStadium.backgroundColor = [UIColor clearColor];
    
    _displayStadium.text = _team.stadiumName;
    _displayStadium.textColor = [UIColor redColor];
    _displayStadium.backgroundColor = [UIColor clearColor];
    _displayCoach.text = _team.coachName;
    _displayCoach.textColor = [UIColor redColor];
    _displayCoach.backgroundColor = [UIColor clearColor];
    
    DataManager *dataManager = [DataManager new];
    
    _listPlayer =[dataManager readPlayerInTeam:_team];
        
    CGRect frame = CGRectMake(0, 100, 320, 310);
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _tableView.scrollEnabled = YES;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    background.image = [UIImage imageNamed:@"PremierLeague.jpg"];
    background.alpha = 0.6;
    [self.view addSubview:background];
    [self.view addSubview:_tableView];
    [self.view addSubview:_logoView];
    [self.view addSubview:_labelStadium];
    [self.view addSubview:_labelCoach];
    [self.view addSubview:_displayCoach];
    [self.view addSubview:_displayStadium];
    
    
    NSString *source = [[NSBundle mainBundle] pathForResource:_team.songName ofType:@"mp3"
                        ];
    _musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:source] error:NULL];
    [_musicPlayer play];
    
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
    cell.detailTextLabel.text = player.playerNationality;
    //NSLog(@"%d %@",indexPath.row, player.playerName);
    
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
    
    [_musicPlayer stop];
}

@end
