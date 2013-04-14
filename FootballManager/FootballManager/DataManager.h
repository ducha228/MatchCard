//
//  DataManager.h
//  FootballManager
//
//  Created by DucHa on 4/12/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "Player.h"

@interface DataManager : NSObject

-(NSMutableArray *) readTeam;
-(NSMutableArray *) readPlayerInTeam: (Team *) team;
-(NSMutableArray *) readPlayerAtPosition: (NSString *) position;
@end
