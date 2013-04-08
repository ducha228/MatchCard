//
//  Level1.h
//  MatchCard
//
//  Created by DucHa on 4/8/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Level1 : UIViewController <UIAlertViewDelegate>
{
    UIImageView *_imageView1;
    UIImageView *_imageView2;
    UIImageView *_imageView3;
    UIImageView *_imageView4;
    UIImageView *_imageView5;
    UIImageView *_imageView6;
    UIImageView *_imageView7;
    UIImageView *_imageView8;
    UIImageView *_imageView9;
    UIImageView *_imageView10;
    UIImageView *_imageView11;
    UIImageView *_imageView12;
    
    UIImageView *_backImage1;
    UIImageView *_backImage2;
    UIImageView *_backImage3;
    UIImageView *_backImage4;
    UIImageView *_backImage5;
    UIImageView *_backImage6;
    UIImageView *_backImage7;
    UIImageView *_backImage8;
    UIImageView *_backImage9;
    UIImageView *_backImage10;
    UIImageView *_backImage11;
    UIImageView *_backImage12;
    
    UIImageView *_mainScreen;
    
    NSMutableArray *_arrayOfImage;
    
    UISlider *_sliderTime;
    UIButton *_rePlay;
    UIButton *_nextLevel;
    
    NSTimer *_timer;
}
@end
