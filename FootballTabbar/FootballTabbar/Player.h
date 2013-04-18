//
//  Player.h
//  FootballManager
//
//  Created by DucHa on 4/10/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

typedef enum {
    GK,
    DF,
    MF,
    FW
}PositionEnum;
@interface Player : NSObject

@property(assign, nonatomic) NSInteger playerId;
@property(strong, nonatomic) NSString *playerName;
@property(strong, nonatomic) NSString *playerNationality;
@property(assign, nonatomic) NSInteger playerAge;
@property(assign, nonatomic) float playerHeight;
@property(assign, nonatomic) PositionEnum playerPosition;
@property(strong, nonatomic) Team *ownerTeam;
@property(assign, nonatomic) NSInteger squadNo;
@property(strong, nonatomic) NSString *profilePicture;


-(id) initWithId: (NSInteger) playerId
         andName: (NSString *) playerName
  andNationality: (NSString *) playerNationality
          andAge: (NSInteger) playerAge
       andHeight: (float) playerHeight
     andPosition: (PositionEnum) playerPosition
         andTeam: (Team *) ownerTeam
      andSquadNO: (NSInteger) squadNo
      andPicture: (NSString *) profilePicture;

-(NSString *) positonToString: (PositionEnum) position;

@end
