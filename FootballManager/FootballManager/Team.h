//
//  Team.h
//  FootballManager
//
//  Created by DucHa on 4/10/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property(assign, nonatomic) NSInteger teamId;
@property(strong, nonatomic) NSString *teamName;
@property(strong, nonatomic) NSString *logoName;
@property(strong, nonatomic) NSString *coachName;
@property(strong, nonatomic) NSString *songName;
@property(strong, nonatomic) NSString *stadiumName;

-(id) initWithId: (NSInteger) teamId
         andName: (NSString *) teamName
         andLogo: (NSString *) logoName
        andCoach: (NSString *) coachName
         andSong: (NSString *) songName
      andStadium: (NSString *) stadiumName;

@end
