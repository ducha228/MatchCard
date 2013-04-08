//
//  ViewController.m
//  MatchCard
//
//  Created by DucHa on 4/6/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"
#import "Level2.h"
#import "Level1.h"


@interface ViewController ()
{
    AVAudioPlayer *audio;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //UIButton *start = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    UIButton *start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    start.frame = CGRectMake(110, 200, 100, 40);
    [start setTitle:@"Start" forState:UIControlStateNormal];
    start.backgroundColor = [UIColor blueColor];
    [start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:start];
    [start addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    background.image = [UIImage imageNamed:@"background2.jpg"];
    [self.view addSubview:background];
    
    [self.view bringSubviewToFront:start];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"START" ofType:@"mp3"];
    //NSLog(@"%@",path);
    NSError *error;
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
    //[audio play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startGame
{
    Level1 *level1 = [[Level1 alloc] initWithNibName:@"Level1" bundle:nil];
    [self presentViewController:level1 animated:YES completion:^{
        
    }];
}
@end
