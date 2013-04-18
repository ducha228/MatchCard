//
//  MatchDetailViewController.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "MatchDetailViewController.h"

@interface MatchDetailViewController ()
{
    UILabel *_labelteamA;
    UILabel *_labelteamB;
    UILabel *_labelwin;
    UILabel *_labeldraw;
    UILabel *_labellose;
    UILabel *_labelHistory;
    
    UIImageView *_logoteamA;
    UIImageView *_logoteamB;
    
}
@end

@implementation MatchDetailViewController

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
    _labelteamA = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 150, 40)];
    _labelteamB = [[UILabel alloc] initWithFrame:CGRectMake(170, 100, 150, 40)];
    _labelHistory = [[UILabel alloc] initWithFrame:CGRectMake(120, 170, 80, 40)];
    _labelwin = [[UILabel alloc] initWithFrame:CGRectMake(120, 220, 80, 40)];
    _labeldraw = [[UILabel alloc] initWithFrame:CGRectMake(120, 270, 80, 40)];
    _labellose = [[UILabel alloc] initWithFrame:CGRectMake(120, 320, 80, 40)];
    _labelteamA.text = _match.teamA;
    _labelteamA.textAlignment = NSTextAlignmentCenter;
    _labelteamB.text = _match.teamB;
    _labelteamB.textAlignment = NSTextAlignmentCenter;
    _labelHistory.text = @"History";
    _labelHistory.textAlignment = NSTextAlignmentCenter;
    _labelwin.text = [NSString stringWithFormat:@"%d",_match.win];
    _labelwin.textAlignment = NSTextAlignmentCenter;
    _labeldraw.text = [NSString stringWithFormat:@"%d",_match.draw];
    _labeldraw.textAlignment = NSTextAlignmentCenter;
    _labellose.text = [NSString stringWithFormat:@"%d",_match.lose];
    _labellose.textAlignment = NSTextAlignmentCenter;
    
    _logoteamA = [[UIImageView alloc] initWithFrame:CGRectMake(45, 20, 70, 70)];
    _logoteamB = [[UIImageView alloc] initWithFrame:CGRectMake(205, 20, 70, 70)];
    
    if([_match.teamA isEqualToString:@"Manchester United"]){
        _logoteamA.image = [UIImage imageNamed:@"ManchesterUnited.jpg"];
        _logoteamB.image = [UIImage imageNamed:@"ManchesterCity.jpg"];
    } else {
        _logoteamA.image = [UIImage imageNamed:@"Chelsea.jpg"];
        _logoteamB.image = [UIImage imageNamed:@"Arsenal.jpg"];
    }
    [self.view addSubview:_labellose];
    [self.view addSubview:_labelteamA];
    [self.view addSubview:_labelteamB];
    [self.view addSubview:_labelHistory];
    [self.view addSubview:_labelwin];
    [self.view addSubview:_labeldraw];
    [self.view addSubview:_logoteamB];
    [self.view addSubview:_logoteamA];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
