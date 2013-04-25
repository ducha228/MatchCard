//
//  ViewController.m
//  Denkeoquan
//
//  Created by DucHa on 4/25/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *_imageArray;
    CGRect frame;
    NSTimer *timer;
    UIButton *stopButton;
    CGFloat currentOffset;
    float speed;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    speed = -0.1;
    currentOffset = _carousel.scrollOffset;
    frame = self.view.frame;
    frame.origin.x = frame.size.width - frame.size.width / 5;
    frame.origin.y = frame.size.height - frame.size.height / 5;
    frame.size.width = frame.size.width - frame.origin.x * 2;
    frame.size.height = frame.size.height - frame.origin.y * 2;
    
    _carousel = [[iCarousel alloc] initWithFrame:frame];
    _imageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 28; i++)
        [_imageArray addObject:[NSString stringWithFormat:@"Cay khe%d.jpg",i]];
    
    _carousel.type = iCarouselTypeCylinder;
    _carousel.dataSource = self;
    _carousel.delegate = self;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"trung thu.jpg"];
    imageView.alpha = 0.8;
    
    stopButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 450, 120, 30)];
    [stopButton addTarget:self action:@selector(stopScrolling) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"Stop Scrolling" forState:UIControlStateNormal];
    [stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stopButton setBackgroundColor:[UIColor clearColor]];
    
    [self startScrolling];
    [self playAudio];
    [self.view addSubview:imageView];
    [self.view addSubview:_carousel];
    [self.view addSubview:stopButton];
    
    
}
- (void) viewDidUnload
{
    //self.carousel = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) playAudio
{
    NSString *source = [[NSBundle mainBundle] pathForResource:@"Chiec Den Ong Sao" ofType:@"mp3"];
    NSLog(@"%@",source);
    NSURL *url = [NSURL fileURLWithPath:source];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    
    [_audioPlayer play];
    
}
- (NSUInteger) numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_imageArray count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:_carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFit;
        imageView = [[UIImageView alloc] initWithFrame:view.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        [view addSubview:imageView];
        view.userInteractionEnabled = YES;
    }
    else
    {
        
    }
    imageView.alpha = 0.75;
    imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:index]];
//    
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                    action:@selector(restartScrolling:)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    
//    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                     action:@selector(restartScrolling:)];
//    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
//    
//    NSLog(@"1");
//    [view addGestureRecognizer:swipeLeft];
//    [view addGestureRecognizer:swipeRight];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(restartScrolling:)];
    
    [imageView addGestureRecognizer:tapGesture];
    return view;
}


- (void) startScrolling
{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(scroll)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void) scroll
{
    //currentOffset = _carousel.scrollOffset;
    //speed = -0.1;
    if(!_carousel.decelerating && !_carousel.dragging) {
        //speed = -0.1;
        _carousel.scrollOffset += speed;
        currentOffset = _carousel.scrollOffset;
        //NSLog(@"%f",currentOffset);
    } else if(currentOffset < _carousel.scrollOffset){
        speed = 0.1;
        //NSLog(@"%f %f",currentOffset, _carousel.scrollOffset);
    } else if(currentOffset > _carousel.scrollOffset){
        speed = -0.1;
        //NSLog(@"%f %f",currentOffset, _carousel.scrollOffset);
    }
}

- (void) stopScrolling
{
    [timer invalidate];
    timer = nil;
}

- (void) restartScrolling: (UITapGestureRecognizer *) tapGesture
{
    if(timer == nil && currentOffset < _carousel.scrollOffset) {
        speed = 0.1;
        NSLog(@"%f %f",currentOffset, _carousel.scrollOffset);
        [self startScrolling];
    } else if(timer == nil && currentOffset > _carousel.scrollOffset) {
        speed = -0.1;
        NSLog(@"%f %f",currentOffset, _carousel.scrollOffset);
        [self startScrolling];
    } 
//    NSLog(@"1");
//    if(timer == nil && swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft){
//        speed = 0.1;
//        [self startScrolling];
//    } else if(timer == nil && swipeGesture.direction == UISwipeGestureRecognizerDirectionRight){
//        speed = -0.1;
//        [self startScrolling];
//    }
}
@end
