//
//  ViewController.m
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "RunTimeModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RunTimeModel  *models = [[RunTimeModel alloc] init];
//    [models acquireAllProperty];
  
//    [models acquireIvarList];
    
    [models acquireMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
