//
//  ViewController.m
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "RunTimeModel.h"
#import "RuntimeManger.h"
//#import "NSMutableArray+SafeArraySet.h"
#import "ZJLogTextView.h"
#import "GetLogFile.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RunTimeModel *models = [[RunTimeModel alloc] init];
    /**
     *  2016-07-01 11:02:16.504 RunTime[5688:2104341] ocPropertyName = namepath
     2016-07-01 11:02:16.505 RunTime[5688:2104341] ocPropertyName = name
     2016-07-01 11:02:16.505 RunTime[5688:2104341] ocPropertyName = address
     2016-07-01 11:02:16.505 RunTime[5688:2104341] ocPropertyName = age
     2016-07-01 11:02:16.505 RunTime[5688:2104341] ocPropertyName = arr
     */
    
//    [RuntimeManger acquireAllPropertyWithClass:models];
    /**
     *  2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = place
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = imagepath
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = _age
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = _name
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = _address
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = _arr
     2016-07-01 11:02:16.506 RunTime[5688:2104341] ocVarName = _namepath
     */
//    [RuntimeManger acquireIvarList:models];
    
    /**
     *  2016-07-01 11:02:16.506 RunTime[5688:2104341] methodName = eat
     2016-07-01 11:02:16.506 RunTime[5688:2104341] methodName = drank
     2016-07-01 11:02:16.506 RunTime[5688:2104341] methodName = privateMethodTest
     2016-07-01 11:02:16.507 RunTime[5688:2104341] methodName = arr
     2016-07-01 11:02:16.508 RunTime[5688:2104341] methodName = setArr:
     2016-07-01 11:02:16.508 RunTime[5688:2104341] methodName = namepath
     2016-07-01 11:02:16.508 RunTime[5688:2104341] methodName = setNamepath:
     2016-07-01 11:02:16.509 RunTime[5688:2104341] methodName = .cxx_destruct
     2016-07-01 11:02:16.509 RunTime[5688:2104341] methodName = setName:
     2016-07-01 11:02:16.509 RunTime[5688:2104341] methodName = name
     2016-07-01 11:02:16.510 RunTime[5688:2104341] methodName = setAddress:
     2016-07-01 11:02:16.510 RunTime[5688:2104341] methodName = setAge:
     2016-07-01 11:02:16.510 RunTime[5688:2104341] methodName = age
     2016-07-01 11:02:16.510 RunTime[5688:2104341] methodName = play
     2016-07-01 11:02:16.511 RunTime[5688:2104341] methodName = address
     */
//    [RuntimeManger acquireMethodList:models];
    
    /**
     *  2016-07-01 11:21:01.061 RunTime[5696:2107229] ocProtocalName = protocaltester
      只是获取到该类需要遵守的协议名，并不是该类持有协议
     */
//    [RuntimeManger acquireProtocalList:models];
    NSLog(@"model.name = %@ ",models.name);
    [RuntimeManger changeIvarValueClass:models andIvar:@"_name" andValue:@"xiaoming"];
    NSLog(@"使用运行时更改值后 model.name = %@",models.name);
    NSMutableArray *arr = [[NSMutableArray alloc] init];
//    [arr objectAtIndex:10];

//    
//    ZJLogTextView *views = [[ZJLogTextView alloc] initWithFrame:CGRectMake(0, 100,300, 400)];
//    
//    [self.view addSubview:views];

    
    [ZJLogTextView shareManger];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        while (1) {
//            NSLog(@"11111");
//            usleep(40*1000);
//        }
 
    });
    
    
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"aaa");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
