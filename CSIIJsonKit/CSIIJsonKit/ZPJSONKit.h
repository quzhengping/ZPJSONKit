//
//  ZPJSONKit.h
//  MobileBankSession
//
//  Created by 曲正平 on 2017/10/16.
//  Copyright © 2017年 曲正平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPJSONKit : NSObject
+ (NSDictionary *)CSIIParseJSONData:(NSData *)jsonData;
@end
