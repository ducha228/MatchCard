//
//  DataManager.m
//  GraphicsChart
//
//  Created by DucHa on 5/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

- (void) readData
{
    
}

- (void) writeData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    NSString *destinationPath = [[NSBundle mainBundle] pathForResource:@"vidu" ofType:@"txt"];
    NSString *data = @"abcdef";
    [data writeToFile:destinationPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@",destinationPath);
    
    for (NSDictionary *item in _dataArray) {
        
    }
}
@end
