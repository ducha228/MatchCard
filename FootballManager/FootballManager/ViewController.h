//
//  ViewController.h
//  FootballManager
//
//  Created by DucHa on 4/10/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "DataManager.h"
#import "TeamDetailController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_listTeam;
    AVAudioPlayer *_audioPlayer;
}
@end
