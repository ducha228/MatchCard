//
//  SearchResultController.h
//  MusicManager
//
//  Created by DucHa on 4/8/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *mArrayResult;
@end
