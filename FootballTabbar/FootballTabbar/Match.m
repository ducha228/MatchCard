//
//  Match.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "Match.h"

@implementation Match

-(id) initWithId:(NSInteger)matchId
        andTeamA:(NSString *)teamA
        andTeamB:(NSString *)teamB
          andWin:(NSInteger)win
         andDraw:(NSInteger)draw
         andLose:(NSInteger)lose
         andDate:(NSString *)date
{
    if(self){
        _matchId = matchId;
        _teamA = teamA;
        _teamB = teamB;
        _win = win;
        _draw = draw;
        _lose = lose;
        _date = date;
    }
    
    return self;
}
@end
