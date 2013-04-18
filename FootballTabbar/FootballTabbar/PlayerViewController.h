//
//  PlayerViewController.h
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllPlayerViewController.h"
#import "AllClubViewController.h"

@interface PlayerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) UIImageView *background;
@end
