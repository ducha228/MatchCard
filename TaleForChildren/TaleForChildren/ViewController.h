//
//  ViewController.h
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tale.h"
#import "TaleDetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *taleNameArray;
@end
