//
//  AllClubViewController.h
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "TeamDetailController.h"
#import <AVFoundation/AVFoundation.h>

@interface AllClubViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate>
{
    NSMutableArray *_listTeam;
    AVAudioPlayer *_audioPlayer;
}
@end
