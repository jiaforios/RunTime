//
//  NSMutableArray+SafeArraySet.m
//  RunTime
//
//  Created by foscom on 16/7/11.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "NSMutableArray+SafeArraySet.h"
#import <objc/runtime.h>
@implementation NSMutableArray (SafeArraySet)
+ (void)load  // 程序启动就执行的方法
{
    NSLog(@"分类load");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        id obj = [[self alloc] init];
        [obj exchangeMethod:@selector(addObject:) withNewMethod:@selector(safeAddObject:)];
        [obj exchangeMethod:@selector(objectAtIndex:) withNewMethod:@selector(safeObjectAtIndex:)];
        [obj exchangeMethod:@selector(insertObject:atIndex:) withNewMethod:@selector(safeInsertObject:atIndex:)];
        [obj exchangeMethod:@selector(removeObjectAtIndex:) withNewMethod:@selector(safeRemoveObjectAtIndex:)];
        [obj exchangeMethod:@selector(replaceObjectAtIndex:withObject:) withNewMethod:@selector(safeReplaceObjectAtIndex:withObject:)];
        
    });
}



- (void)exchangeMethod:(SEL)oldSelector withNewMethod:(SEL)newSelector
{

    Method oldMethod = class_getInstanceMethod([self class], oldSelector);
    Method newMethod = class_getInstanceMethod([self class], newSelector);
    BOOL isMethodExit = class_addMethod([self class], oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    // 如果oldMethod 已经存在则 isMethodExit = NO 反之 isMethodExit = YES
    if (isMethodExit) {
//        NSLog(@"方法不存在，现在添加成功了，直接replace");
        class_replaceMethod([self class], newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        
    }else
    {
//        NSLog(@"方法存在 直接交换");
        
        method_exchangeImplementations(oldMethod, newMethod);
    }
    
}


- (void)safeAddObject:(id)aObj
{
    if (aObj) {
        [self safeAddObject:aObj];
    }else
    {
        NSLog(@"error!!!! *** while add a obj is nil");
    }
}

- (void)safeObjectAtIndex:(NSUInteger)index
{
    if (index > self.count -1) {
        
        NSLog(@"error!!!! *** while add a obj is nil");
        return;
    }else
    {
        [self safeObjectAtIndex:index];
    }
}


@end
