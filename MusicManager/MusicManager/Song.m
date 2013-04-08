//
//  Song.m
//  MusicManager
//
//  Created by DucHa on 4/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "Song.h"


@implementation Song
-(id) init:(NSString *)songName andSinger:(NSString *)singerName andYear:(NSInteger)songYear andGenre:(GenreEnum)songGenre andUrl:(NSString *)imageCover {
    if(self = [super init]){
        _name = songName;
        _singer = singerName;
        _year = songYear;
        _genre = songGenre;
        _imageUrl = imageCover;
    }
    return self;
}
-(NSString *) description {
    NSString *stringGenre;
    if(_genre == pop) stringGenre = @"pop";
    else if(_genre == rock) stringGenre = @"rock";
    else if(_genre == country) stringGenre = @"country";
    else stringGenre = @"jazz";
    NSString *result = [NSString stringWithFormat:@"Song: %@   Singer: %@   Year: %d   Genre: %@\n",_name,_singer,_year,stringGenre];
    return result;
}
@end
