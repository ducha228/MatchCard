//
//  TaleDetailViewController.h
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tale.h"
#import <AVFoundation/AVFoundation.h>

@interface TaleDetailViewController : UIViewController
@property (strong, nonatomic) Tale *tale;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSString *audioName;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end
