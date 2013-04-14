//
//  PlayerDetailController.m
//  FootballManager
//
//  Created by DucHa on 4/13/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "PlayerDetailController.h"

@interface PlayerDetailController ()
{
    UILabel *labelName;
    UILabel *displayName;
    UILabel *labelNationality;
    UILabel *displayNationality;
    UILabel *labelTeam;
    UILabel *displayTeam;
    UILabel *labelAge;
    UILabel *displayAge;
    UILabel *labelHeight;
    UILabel *displayHeight;
    UILabel *labelPosition;
    UILabel *displayPosition;
    UILabel *labelSquadNo;
    UILabel *displaySquadNo;
    
    UIImageView *profilePicture;
}

@end

@implementation PlayerDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"PlayerDetail"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    labelName = [UILabel new];
    labelName.text = @"Name";
    labelName.tag = 1;
    [self.view addSubview:labelName];
    
    labelNationality = [[UILabel alloc] init];
    labelNationality.text = @"Nationality";
    labelNationality.tag = 2;
    [self.view addSubview:labelNationality];
    
    labelTeam = [UILabel new];
    labelTeam.text = @"Team";
    labelTeam.tag = 3;
    [self.view addSubview:labelTeam];
    
    labelAge = [UILabel new];
    labelAge.text = @"Age";
    labelAge.tag = 4;
    [self.view addSubview:labelAge];
    
    labelHeight = [UILabel new];
    labelHeight.text = @"Height";
    labelHeight.tag = 5;
    [self.view addSubview:labelHeight];
    
    labelPosition = [UILabel new];
    labelPosition.text = @"Position";
    labelPosition.tag = 6;
    [self.view addSubview:labelPosition];
    
    labelSquadNo = [UILabel new];
    labelSquadNo.text = @"SquadNo";
    labelSquadNo.tag = 7;
    [self.view addSubview:labelSquadNo];
    
    NSInteger x = 20;
    NSInteger y = 20;
    
    for(int i = 1;i <= 7;i++) {
        [self.view viewWithTag:i].frame = CGRectMake(x, y, 100, 30);
        y += 40;
        
    }
    
    displayName = [UILabel new];
    displayName.text = _player.playerName;
    displayName.tag = 8;
    [self.view addSubview:displayName];
    
    displayNationality = [[UILabel alloc] init];
    displayNationality.text = _player.playerNationality;
    displayNationality.tag = 9;
    [self.view addSubview:displayNationality];
    
    displayTeam = [UILabel new];
    displayTeam.text = [NSString stringWithFormat:@"%@",_player.ownerTeam];
    displayTeam.tag = 10;
    [self.view addSubview:displayTeam];
    
    displayAge = [UILabel new];
    displayAge.text = [NSString stringWithFormat:@"%d",_player.playerAge];
    displayAge.tag = 11;
    [self.view addSubview:displayAge];
    
    displayHeight = [UILabel new];
    displayHeight.text = [NSString stringWithFormat:@"%.2f m",_player.playerHeight];
    displayHeight.tag = 12;
    [self.view addSubview:displayHeight];
    
    displayPosition = [UILabel new];
    displayPosition.text = [_player positonToString:_player.playerPosition];
    displayPosition.tag = 13;
    [self.view addSubview:displayPosition];
    
    displaySquadNo = [UILabel new];
    displaySquadNo.text = [NSString stringWithFormat:@"%d",_player.squadNo];
    displaySquadNo.tag = 14;
    [self.view addSubview:displaySquadNo];
    
    x = 130;
    y = 20;
    for(int i = 8; i<=14;i++) {
        [self.view viewWithTag:i].frame = CGRectMake(x, y, 180, 30);
        y += 40;
    }
    
    profilePicture = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    profilePicture.image = [UIImage imageNamed:_player.profilePicture];
    profilePicture.alpha = 0.6;
    [self.view addSubview:profilePicture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
