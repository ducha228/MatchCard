//
//  Team.m
//  FootballManager
//
//  Created by DucHa on 4/10/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "Team.h"

@implementation Team

-(id) initWithId:(NSInteger)teamId andName:(NSString *)teamName andLogo:(NSString *)logoName andCoach:(NSString *)coachName andSong:(NSString *)songName andStadium:(NSString *)stadiumName {
    _teamId = teamId;
    _teamName = teamName;
    _logoName = logoName;
    _coachName = coachName;
    _songName = songName;
    _stadiumName = stadiumName;
    
    return self;
}

@end
