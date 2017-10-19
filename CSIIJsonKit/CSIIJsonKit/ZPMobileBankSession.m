//
//  CSIIMobileBankSession.m
//  CSIIJsonKit
//
//  Created by 曲正平 on 2017/10/16.
//  Copyright © 2017年 曲正平. All rights reserved.
//

#import "ZPMobileBankSession.h"
#import "AFNetworking/AFNetworking.h"

@implementation ZPMobileBankSession
+ (ZPMobileBankSession *)sharedInstance {
    static ZPMobileBankSession *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//线程安全
        sharedInstance = [[ZPMobileBankSession alloc] init];
    });
    return sharedInstance;
}


-(void)postToServer:(NSString *)action actionParams:(NSMutableDictionary *)params{
    
    if (params==nil) {
        params = [[NSMutableDictionary alloc]init];
    }
    [params setObject:@"zh_CN" forKey:@"_locale"];
    [params setObject:@"9999" forKey:@"BankId"];
    NSString *urlString = @"http://39.108.70.238:10000/mock/59e01385ffa11339854002b9/pweb/QryGodMerchandiseEval.do";
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *dataTask = [manger POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask *task,id JSON){
        
        NSLog(@"AFNetworking-JSONKit BasicMessage Completion:%@",JSON);
        if(JSON){
            
        }else{
            NSLog(@"AFNetworking-JSONKit-JSON数据解析失败。");
        }
        
    } failure:^(NSURLSessionDataTask *task,NSError *error){
        NSLog(@"AFNetworking-JSONKit -BasicMessage Error!%@ %@",action,error);
        
    }];
    
    [dataTask resume];
}





    




@end
