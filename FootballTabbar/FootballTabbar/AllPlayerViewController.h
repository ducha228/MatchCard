//
//  AllPlayerViewController.h
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "Player.h"
#import "PlayerDetailController.h"

@interface AllPlayerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) NSMutableArray *listPlayer;
@property(strong, nonatomic) UITableView *tableView;
@end
