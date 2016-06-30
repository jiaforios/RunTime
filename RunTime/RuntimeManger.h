//
//  RuntimeManger.h
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeManger : NSObject
+ (void)acquireAllPropertyWithClass:(id)className;
+ (void)acquireIvarList:(id)className;
+ (void)acquireMethod:(id)className;


@end
