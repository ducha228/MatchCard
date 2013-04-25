//
//  ViewController.h
//  Denkeoquan
//
//  Created by DucHa on 4/25/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
    
}
@property (retain, nonatomic) iCarousel *carousel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
