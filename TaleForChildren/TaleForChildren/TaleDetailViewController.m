//
//  TaleDetailViewController.m
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "TaleDetailViewController.h"

@interface TaleDetailViewController ()
{
    NSInteger _currentPage;
    NSMutableArray *_imageViewArray;
    UIView *_transparentView;
    UIPageControl *_pageControll;
}
@end

@implementation TaleDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (void) loadView {
    [super loadView];
    [self loadImage];
}

- (void) loadImage {
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect frame = self.view.frame;
    frame.size.height = 430;
    _transparentView = [[UIView alloc] initWithFrame:frame];
    
    _imageArray = [NSMutableArray arrayWithArray:_tale.imageArray];
    _audioName = _tale.audioName;
    
    _imageViewArray = [[NSMutableArray alloc] initWithCapacity:[_imageArray count]];
    
    for (int i = 0; i < [_imageArray count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_transparentView.frame];
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:i]];
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        [imageView addGestureRecognizer:swipeLeft];
        [imageView addGestureRecognizer:swipeRight];
        
        [_imageViewArray addObject:imageView];
    }
    _currentPage = 0;
    [self.view addSubview:_transparentView];
    [_transparentView addSubview:[_imageViewArray objectAtIndex:_currentPage]];
    
    _pageControll.currentPage = _currentPage;
    _pageControll.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    frame.origin.y = 450;
    frame.size.height = 20;
    _pageControll.frame = frame;
    [_pageControll addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:_pageControll];

    NSString *type = [NSString new];
    if([_tale.taleName isEqualToString:@"Cay khe"])
        type = @"wma";
    else
        type = @"mp3";
    NSString *source = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:_audioName ofType:type]];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:source];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    [_audioPlayer play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) swipeLeft: (UISwipeGestureRecognizer *) swipeGesture
{
    if(_currentPage == [_imageViewArray count]-1) return;
    [UIView transitionWithView:_transparentView duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void){
        [_imageViewArray[_currentPage] removeFromSuperview];
        [_transparentView addSubview:_imageViewArray[_currentPage + 1]];
    }completion:^(BOOL finished){
        _currentPage ++;
        _pageControll.currentPage = _currentPage;
    }];
}

- (void) swipeRight: (UISwipeGestureRecognizer *) swipeGesture
{
    if(_currentPage == 0) return;
    [UIView transitionWithView:_transparentView duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void){
        [_imageViewArray[_currentPage] removeFromSuperview];
        [_transparentView addSubview:_imageViewArray[_currentPage - 1]];
    }completion:^(BOOL finished){
        _currentPage --;
        _pageControll.currentPage = _currentPage;
    }];
    
}

- (void) valueChange
{
    [_imageViewArray[_currentPage] removeFromSuperview];
    [_transparentView addSubview:_imageViewArray[_pageControll.currentPage]];
    _currentPage = _pageControll.currentPage;
}
@end
