//
//  ViewController.m
//  MatchCard
//
//  Created by DucHa on 4/6/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *imageChose;
    NSInteger remainImage;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self reInit];
    [self playingGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) flip:(UITapGestureRecognizer *) tap
{
    [UIView transitionWithView:tap.view duration:0.2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self.view bringSubviewToFront:[self.view viewWithTag:tap.view.tag - 12 ]];
    }completion:^(BOOL finished){
        

        [imageChose addObject:[self.view viewWithTag:tap.view.tag - 12 ]];
        if([imageChose count] == 2)
        {
            //NSLog(@"Two image selected");
            
            UIImageView *chose1 = (UIImageView *)[imageChose objectAtIndex:0];
            UIImageView *chose2 = (UIImageView *)[imageChose objectAtIndex:1];
            
            
            UIImage *image1 = chose1.image;
            UIImage *image2 = chose2.image;
            
            if([self image:image1 isEqualTo:image2])
            {
                [[self.view viewWithTag:chose1.tag + 12] removeFromSuperview];
                [[self.view viewWithTag:chose2.tag + 12] removeFromSuperview];
                
                [chose1 removeFromSuperview];
                [chose2 removeFromSuperview];
                remainImage -= 2;
            } else
            {
                [self.view bringSubviewToFront:[self.view viewWithTag:chose1.tag + 12]];
                [self.view bringSubviewToFront:[self.view viewWithTag:chose2.tag + 12]];
            }
            [imageChose removeAllObjects];
        }

    }];
    
    
}

-(void) reInit
{
    
    _arrayOfImage = [[NSMutableArray alloc] init];
    
    imageChose = [NSMutableArray new];
    
    remainImage = 12;
    
    for(int i= 1;i<=6;i++)
    {
        [_arrayOfImage addObject:[NSString stringWithFormat:@"%d.png",i]];
        [_arrayOfImage addObject:[NSString stringWithFormat:@"%d.png",i]];
    }
                     
                     
    NSInteger width = 70;
    NSInteger height = 70;
    NSInteger random;
    
    _imageView1 = [[UIImageView alloc] init];
    _imageView2 = [UIImageView new];
    _imageView3 = [UIImageView new];
    _imageView4 = [UIImageView new];
    _imageView5 = [UIImageView new];
    _imageView6 = [UIImageView new];
    _imageView7 = [UIImageView new];
    _imageView8 = [UIImageView new];
    _imageView9 = [UIImageView new];
    _imageView10 = [UIImageView new];
    _imageView11 = [UIImageView new];
    _imageView12 = [UIImageView new];
    
    
    _backImage1 = [UIImageView new];
    _backImage2 = [UIImageView new];
    _backImage3 = [UIImageView new];
    _backImage4 = [UIImageView new];
    _backImage5 = [UIImageView new];
    _backImage6 = [UIImageView new];
    _backImage7 = [UIImageView new];
    _backImage8 = [UIImageView new];
    _backImage9 = [UIImageView new];
    _backImage10 = [UIImageView new];
    _backImage11 = [UIImageView new];
    _backImage12 = [UIImageView new];
    
    
    NSMutableArray *imageViewArray = [[NSMutableArray alloc] initWithObjects:_imageView1,_imageView2,_imageView3, _imageView4, _imageView5, _imageView6, _imageView7, _imageView8, _imageView9, _imageView10, _imageView11, _imageView12, nil];
    
    NSMutableArray *backImageViewArray = [[NSMutableArray alloc] initWithObjects:_backImage1, _backImage2, _backImage3, _backImage4, _backImage5, _backImage6, _backImage7, _backImage8, _backImage9, _backImage10, _backImage11, _backImage12, nil];

    
    for(int i=0;i<4;i++)
        for(int j=0;j<3;j++)
        {
            UIImageView *imageView = (UIImageView *) [imageViewArray objectAtIndex:i * 3 + j];
            imageView.frame = CGRectMake(30 * (j+1) + width * j, 20 * (i+1) + height * i, width, height);
            
            [imageView setTag:i * 3 +j + 1];
            imageView.backgroundColor = [UIColor blackColor];
            random = arc4random()%[_arrayOfImage count];
            imageView.image = [UIImage imageNamed:[_arrayOfImage objectAtIndex:random]];
            [_arrayOfImage removeObjectAtIndex:random];
            
            //imageView.image = [UIImage imageNamed:@"sexy-girl-iphone-wallpaper-3.jpg"];
            [self.view addSubview:imageView];
        }
    
    
    for(int i=0;i<4;i++)
        for(int j=0;j<3;j++)
        {
            UIImageView *imageView = (UIImageView *) [backImageViewArray objectAtIndex:i * 3 + j];
            imageView.frame = CGRectMake(30 * (j+1) + width * j, 20 * (i+1) + height * i, width, height);
            
            [imageView setTag:i * 3 +j + 13];
            imageView.backgroundColor = [UIColor blackColor];
            imageView.image = [UIImage imageNamed:@"backcard.png"];
            [self.view addSubview:imageView];
        }
    
    
    _sliderTime = [[UISlider alloc] initWithFrame:CGRectMake(30, 370, 270, 10)];
    _sliderTime.maximumTrackTintColor = [UIColor blueColor];
    _sliderTime.minimumTrackTintColor = [UIColor greenColor];
    _sliderTime.maximumValue = 30;
    _sliderTime.minimumValue = 0;
    _sliderTime.value = 30;
    [self.view addSubview:_sliderTime];
    
    
    _rePlay = [[UIButton alloc] initWithFrame:CGRectMake(90, 400, 140, 40)];
    [_rePlay setTitle:@"Play Again" forState:UIControlStateNormal];
    _rePlay.backgroundColor = [UIColor blueColor];
    [_rePlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rePlay setImage:[UIImage imageNamed:@"replay.png"] forState:UIControlStateNormal];
    [_rePlay addTarget:self action:@selector(rePlaygame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rePlay];
}


-(void) playingGame
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(sliderTimeChange) userInfo:nil repeats:YES];
    
    for(UIView *view in self.view.subviews){
        if( [imageChose count] <2 && view.tag > 12 && [view isKindOfClass:[UIImageView class]]){
            
            UIImageView *imageView = (UIImageView *) view;
            
            imageView.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
            
            [imageView addGestureRecognizer:tap];
            
        }
    }
}

-(BOOL) image: (UIImage *) image1
    isEqualTo: (UIImage *) image2
{
    NSData *data1 = UIImagePNGRepresentation(image1);
    NSData *data2 = UIImagePNGRepresentation(image2);
    return [data1 isEqualToData:data2];
}

-(void) rePlaygame
{
    for(UIView *view in self.view.subviews)
    {
        [view removeFromSuperview];
    }
    [self reInit];
    [self playingGame];
}

-(void) sliderTimeChange
{
    //NSLog(@"%f",_sliderTime.value);
    _sliderTime.value = _sliderTime.value - 0.01;
    //NSLog(@"%d",remainImage);
    if(_sliderTime.value <0.01f)
    {
        [self lose];
    } else if(remainImage == 0)
    {
        [self win];
    }
    //NSLog(@"%f",count);
}

-(void) lose
{
    if(_timer)
    {
        [_timer invalidate];
        _timer = nil;
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UIImageView class]])
            {
                [view removeFromSuperview];
            }
        }
        UIImageView *loseImage = [[UIImageView alloc] initWithFrame:CGRectMake(60, 90, 200, 150)];
        loseImage.backgroundColor = [UIColor blackColor];
        loseImage.image = [UIImage imageNamed:@"lose.png"];
        [self.view addSubview:loseImage];
        
        UILabel *loseLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 250, 75, 40)];
        loseLabel.text = @"You Lose";
        loseLabel.textColor = [UIColor redColor];
        loseLabel.backgroundColor = [UIColor blueColor];
        [self.view addSubview:loseLabel];
    }
}

-(void) win
{
    if(_timer)
    {
        [_timer invalidate];
        _timer = nil;
        
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UIImageView class]])
            {
                [view removeFromSuperview];
            }
        }
        UIImageView *winImage = [[UIImageView alloc] initWithFrame:CGRectMake(60, 90, 200, 150)];
        winImage.backgroundColor = [UIColor blackColor];
        winImage.image = [UIImage imageNamed:@"win.png"];
        [self.view addSubview:winImage];
        
        UILabel *winLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 250, 80, 80)];
        winLabel.text = [NSString stringWithFormat:@" You Win"];
        winLabel.textColor = [UIColor redColor];
        winLabel.backgroundColor = [UIColor blueColor];
        [self.view addSubview:winLabel];
    }
}

-(void) doNothing
{
    
}
@end
