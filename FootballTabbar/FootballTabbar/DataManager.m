//
//  DataManager.m
//  FootballManager
//
//  Created by DucHa on 4/12/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

-(NSMutableArray *) readTeam {
    NSMutableArray *listDictionary = [NSMutableArray new];
    NSMutableArray *listTeam = [NSMutableArray new];
    NSString *path =[[NSBundle mainBundle] pathForResource:@"Team" ofType:@"plist"];
    
    listDictionary = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *item in listDictionary) {
        NSNumber *teamId = [item valueForKey:@"teamId"];
        
        Team *team = [[Team alloc] initWithId:teamId.integerValue
                                      andName:[item valueForKey:@"teamName"]
                                      andLogo:[item valueForKey:@"logoName"]
                                     andCoach:[item valueForKey:@"coachName"]
                                      andSong:[item valueForKey:@"songName"]
                                   andStadium:[item valueForKey:@"stadiumName"]
                      ];
        [listTeam addObject:team];
    }
    
    return listTeam;
}

- (NSMutableArray *) readPlayer {
    NSMutableArray *listDictionary = [NSMutableArray new];
    NSMutableArray *listPlayer = [NSMutableArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Player" ofType:@"plist"];
    listDictionary = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *item in listDictionary){
        NSNumber *playerId = [item valueForKey:@"playerId"];
        NSNumber *playerAge = [item valueForKey:@"playerAge"];
        NSNumber *squadNo = [item valueForKey:@"squadNo"];
        NSString *playerPosition = [item valueForKey:@"playerPosition"];
            
        NSNumber *playerHeight = [item valueForKey:@"playerHeight"];
        float floatHeight = playerHeight.floatValue;
            
        Player *player = [[Player alloc] initWithId:playerId.integerValue
                                            andName:[item valueForKey:@"playerName"]
                                     andNationality:[item valueForKey:@"playerNationality"]
                                             andAge:playerAge.integerValue
                                          andHeight: floatHeight
                                        andPosition:[self stringToEnum:playerPosition]
                                            andTeam:[item valueForKey:@"ownerTeam"]
                                         andSquadNO:squadNo.integerValue
                                         andPicture:[item valueForKey:@"profilePicture"]
                              ];
            [listPlayer addObject:player];
    }
    return  listPlayer;
}
-(NSMutableArray *) readPlayerInTeam:(Team *)team {
    NSMutableArray *listPlayer = [NSMutableArray new];
    NSMutableArray *listPlayerInTeam = [NSMutableArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Player" ofType:@"plist"];
    
    listPlayer = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *item in listPlayer){
        if([[item valueForKey:@"ownerTeam"] isEqual:team.teamName]) {
            NSNumber *playerId = [item valueForKey:@"playerId"];
            NSNumber *playerAge = [item valueForKey:@"playerAge"];
            NSNumber *squadNo = [item valueForKey:@"squadNo"];
            NSString *playerPosition = [item valueForKey:@"playerPosition"];
            
            NSNumber *playerHeight = [item valueForKey:@"playerHeight"];
            float floatHeight = playerHeight.floatValue;
            
            Player *player = [[Player alloc] initWithId:playerId.integerValue
                                                andName:[item valueForKey:@"playerName"]
                                         andNationality:[item valueForKey:@"playerNationality"]
                                                 andAge:playerAge.integerValue
                                              andHeight: floatHeight
                                            andPosition:[self stringToEnum:playerPosition] andTeam:[item valueForKey:@"ownerTeam"]
                                             andSquadNO:squadNo.integerValue
                                             andPicture:[item valueForKey:@"profilePicture"]
                              ];
            [listPlayerInTeam addObject:player];
            //NSLog(@"%@",player.playerName);
        }
    }
    
    return listPlayerInTeam;
}

-(NSMutableArray *) readPlayerAtPosition:(NSString *)position {
    NSMutableArray *listPlayer = [NSMutableArray new];
    NSMutableArray *listPlayerAtPosition = [NSMutableArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Player" ofType:@"plist"];
    
    listPlayer = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *item in listPlayer) {
        if([[item valueForKey:@"playerPosition"] isEqual:position]) {
            
            NSNumber *playerId = [item valueForKey:@"playerId"];
            NSNumber *playerAge = [item valueForKey:@"playerAge"];
            NSNumber *squadNo = [item valueForKey:@"squadNo"];
            
            NSString *playerPosition = [item valueForKey:@"playerPosition"];
            
            NSNumber *playerHeight = [item valueForKey:@"playerHeight"];
            float floatHeight = playerHeight.floatValue;
            
            Player *player = [[Player alloc] initWithId:playerId.integerValue
                                                andName:[item valueForKey:@"playerName"]
                                         andNationality:[item valueForKey:@"playerNationality"]
                                                 andAge:playerAge.integerValue
                                              andHeight: floatHeight
                                            andPosition:[self stringToEnum:playerPosition] andTeam:[item valueForKey:@"ownerTeam"]
                                             andSquadNO:squadNo.integerValue
                                             andPicture:[item valueForKey:@"profilePicture"]
                              ];
            [listPlayerAtPosition addObject:player];
            
        }
    }
    return listPlayerAtPosition;
}

-(NSMutableArray *) readMatch {
    NSMutableArray *listDictionary = [NSMutableArray new];
    NSMutableArray *listMatch = [NSMutableArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Match" ofType:@"plist"];
    listDictionary = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *item in listDictionary) {
        NSNumber *matchId = [item valueForKey:@"matchId"];
        NSNumber *win = [item valueForKey:@"win"];
        NSNumber *draw = [item valueForKey:@"draw"];
        NSNumber *lose = [item valueForKey:@"lose"];
        
        Match *match = [[Match alloc] initWithId:matchId.integerValue
                                        andTeamA:[item valueForKey:@"teamA"]
                                        andTeamB:[item valueForKey:@"teamB"]
                                          andWin:win.integerValue
                                         andDraw:draw.integerValue
                                         andLose:lose.integerValue
                                         andDate:[item valueForKey:@"date"]];
        [listMatch addObject:match];
    }
    return listMatch;
}
-(PositionEnum) stringToEnum:(NSString *) stringPosition {
    if([stringPosition isEqual:@"GK"])
        return GK;
    else if([stringPosition isEqual:@"DF"])
        return DF;
    else if([stringPosition isEqual:@"MF"])
        return MF;
    else
        return FW;
}
@end
