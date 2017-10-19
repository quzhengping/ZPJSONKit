//
//  CSIIMobileBankSession.h
//  CSIIJsonKit
//
//  Created by 曲正平 on 2017/10/16.
//  Copyright © 2017年 曲正平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPMobileBankSession : NSObject
+ (ZPMobileBankSession *)sharedInstance;

-(void)postToServer:(NSString *)action actionParams:(NSMutableDictionary *)params;

@end
