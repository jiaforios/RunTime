//
//  RuntimeManger.h
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeManger : NSObject
/**
 *  回去全部属性列表
 *
 *  @param className 类名
 */
+ (void)acquireAllPropertyWithClass:(id)className;
/**
 *  获取全部成员列表
 *
 *  @param className 类名
 */
+ (void)acquireIvarList:(id)className;
/**
 *  获取方法列表
 *
 *  @param className 类名
 */
+ (void)acquireMethodList:(id)className;

/**
 *  获取协议列表
 *
 *  @param className 类名
 */
+ (void)acquireProtocalList:(id)className;

/**
 *  获取方法
 */


+ (void)acquireMethod:(id)className andMethodName:(char *)methodName;


/**
 *  添加方法
 */

+ (void)addMethod;


/**
 *  动态改变变量的值
 */


+ (void)changeIvarValueClass:(id)className andIvar:(NSString*)ivar andValue:(id)value;


@end
