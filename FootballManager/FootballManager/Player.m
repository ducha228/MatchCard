//
//  Player.m
//  FootballManager
//
//  Created by DucHa on 4/10/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id) initWithId:(NSInteger)playerId
         andName:(NSString *)playerName
  andNationality:(NSString *)playerNationality
          andAge:(NSInteger)playerAge
       andHeight:(float)playerHeight
     andPosition:(PositionEnum)playerPosition
         andTeam:(Team *)ownerTeam
      andSquadNO:(NSInteger)squadNo
      andPicture:(NSString *)profilePicture {
    
    _playerId = playerId;
    _playerName = playerName;
    _playerNationality = playerNationality;
    _playerAge = playerAge;
    _playerHeight = playerHeight;
    _playerPosition = playerPosition;
    _ownerTeam = ownerTeam;
    _squadNo = squadNo;
    _profilePicture = profilePicture;
    
    return self;
}

-(NSString *) positonToString:(PositionEnum)position {
    switch (position) {
        case GK:
            return @"GK";
        case DF:
            return @"DF";
        case MF:
            return @"MF";
        case FW:
            return @"CF";
        default:
            break;
    }
}
@end
