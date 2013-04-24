//
//  Tale.h
//  TaleForChildren
//
//  Created by DucHa on 4/24/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tale : NSObject

@property(strong, nonatomic) NSString *taleName;
@property(strong, nonatomic) NSMutableArray *imageArray;
@property(strong, nonatomic) NSString *audioName;
@property(assign, nonatomic) NSInteger numberOfImage;

- (id) initWithName: (NSString *) taleName;
@end
