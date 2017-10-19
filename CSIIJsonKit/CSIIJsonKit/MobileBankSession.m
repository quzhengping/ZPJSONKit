    

//
//  MobileBankSession.m
//  MobileBankSession
//
//  Created by 曲正平 on 13-6-20.
//  Copyright (c) 2013年 曲正平. All rights reserved.
//

#import "MobileBankSession.h"
#import "ZPJSONKit.h"
#import "AFNetworking/AFNetworking.h"
@implementation MobileBankSession


+ (MobileBankSession *)sharedInstance {
    static MobileBankSession *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//线程安全
        sharedInstance = [[MobileBankSession alloc] init];
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
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURLSessionDataTask *dataTask = [manger POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask *task,id data){
        
        NSDictionary *JSON = [ZPJSONKit CSIIParseJSONData:data];
        NSLog(@"ZPJSONKit BasicMessage Completion:%@",JSON);
        
        if(JSON){
            
        }else{
            NSLog(@"ZPJSONKit-JSON数据解析失败。");
        }
        
    } failure:^(NSURLSessionDataTask *task,NSError *error){
        NSLog(@"ZPJSONKit -BasicMessage Error!%@ %@",action,error);
        
    }];
    
    [dataTask resume];
}



@end







