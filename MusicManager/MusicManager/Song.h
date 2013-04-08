//
//  Song.h
//  MusicManager
//
//  Created by DucHa on 4/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    pop,
    rock,
    country,
    rap,
    jazz
}GenreEnum;

@interface Song : NSObject
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *singer;
@property(assign,nonatomic) NSInteger year;
@property(assign,nonatomic) GenreEnum genre;
@property(strong,nonatomic) NSString *imageUrl;
- (id) init: (NSString *) songName
  andSinger: (NSString *) singerName
    andYear: (NSInteger) songYear
   andGenre: (GenreEnum) songGenre
     andUrl: (NSString *) imageCover;
@end
