//
//  ViewController.h
//  MusicManager
//
//  Created by DucHa on 4/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    Song *_song;
}
@end
