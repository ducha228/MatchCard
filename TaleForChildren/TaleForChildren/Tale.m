//
//  Tale.m
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "Tale.h"

@implementation Tale

- (id) initWithName:(NSString *)taleName
{
    self.taleName = taleName;
    if([taleName isEqualToString:@"Cay khe"]) {
        self.numberOfImage = 29;
    } else if([taleName isEqualToString:@"Tri khon cua ta day"]) {
        self.numberOfImage = 6;
    }
    self.imageArray = [[NSMutableArray alloc] initWithCapacity:self.numberOfImage];
    for( int i = 0; i <= self.numberOfImage; i++) {
        [self.imageArray addObject:[NSString stringWithFormat:@"%@%d.jpg",self.taleName,i]];
    }
    self.audioName = [NSString stringWithFormat:@"%@",taleName];
    
    return self;
}
@end
