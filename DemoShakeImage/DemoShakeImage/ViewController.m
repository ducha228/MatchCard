//
//  ViewController.m
//  DemoShakeImage
//
//  Created by DucHa on 4/8/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
{
    UIImageView *imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 140)];
    imageView.image = [UIImage imageNamed:@"My love.jpg"];
    [self.view addSubview:imageView];
    
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shake:)];
    [imageView addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) shake: (UITapGestureRecognizer *) tapGesture
{
    NSLog(@"You click on me");
    CABasicAnimation *shakeImage = [CABasicAnimation animationWithKeyPath:@"imageView"];
    [shakeImage setAutoreverses:YES];
    [shakeImage setDuration:0.2];
    [shakeImage setRepeatCount:2];
    
    [shakeImage setFromValue:[NSValue valueWithCGPoint:CGPointMake(tapGesture.view.center.x + 10, tapGesture.view.center.y)]];
    [shakeImage setToValue:[NSValue valueWithCGPoint: CGPointMake(tapGesture.view.center.x - 10, tapGesture.view.center.y)]];
    
    [tapGesture.view.layer addAnimation:shakeImage forKey:@"imageView"];
}
@end
