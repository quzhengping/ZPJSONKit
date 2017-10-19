//
//  MobileBankSession.h
//  MobileBankSession
//
//  Created by Yuxiang on 13-6-20.
//  Copyright (c) 2013年 曲正平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface MobileBankSession : NSObject
+ (MobileBankSession *)sharedInstance;
-(void)postToServer:(NSString *)action actionParams:(NSMutableDictionary *)params;


@end




