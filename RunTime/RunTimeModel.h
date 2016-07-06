//
//  RunTimeModel.h
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
@interface RunTimeModel : NSObject<protocaltester>

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, assign) int age;
@property (nonatomic,strong)NSArray *arr;


- (void)play;
- (void)eat;
- (void)drank;
+ (void)palyActios;


@end
