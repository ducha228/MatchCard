//
//  DataManager.h
//  GraphicsChart
//
//  Created by DucHa on 5/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    NSMutableArray *_dataArray;
}
- (void) readData;
- (void) writeData;
@end
