//
//  Match.h
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Match : NSObject
@property(assign, nonatomic) NSInteger matchId;
@property(strong, nonatomic) NSString *teamA;
@property(strong, nonatomic) NSString *teamB;
@property(assign, nonatomic) NSInteger win;
@property(assign, nonatomic) NSInteger draw;
@property(assign, nonatomic) NSInteger lose;
@property(strong, nonatomic) NSString *date;
-(id) initWithId:(NSInteger) matchId
        andTeamA: (NSString *) teamA
        andTeamB: (NSString *) teamB
          andWin: (NSInteger) win
         andDraw: (NSInteger) draw
         andLose: (NSInteger) lose
         andDate: (NSString *) date;

@end
