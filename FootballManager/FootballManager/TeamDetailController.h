//
//  TeamDetailController.h
//  FootballManager
//
//  Created by DucHa on 4/13/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "Player.h"
#import "DataManager.h"
#import "PlayerDetailController.h"
#import <AVFoundation/AVFoundation.h>

@interface TeamDetailController : UIViewController <UITableViewDelegate , UITableViewDataSource, AVAudioPlayerDelegate>
{
    UIImageView *_logoView;
    UILabel *_labelCoach;
    UILabel *_displayCoach;
    UILabel *_labelStadium;
    UILabel *_displayStadium;
    
    UITableView *_tableView;
    NSMutableArray *_listPlayer;
    AVAudioPlayer *_musicPlayer;
}
@property(strong,nonatomic) Team *team;

@end
