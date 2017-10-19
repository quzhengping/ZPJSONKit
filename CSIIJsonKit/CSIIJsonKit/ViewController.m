//
//  ViewController.m
//  CSIIJsonKit
//
//  Created by 曲正平 on 2017/10/16.
//  Copyright © 2017年 曲正平. All rights reserved.
//

#import "ViewController.h"
#import "ZPMobileBankSession.h"
#import "MobileBankSession.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[MobileBankSession sharedInstance]postToServer:nil actionParams:nil];
    [[ZPMobileBankSession sharedInstance]postToServer:nil actionParams:nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
