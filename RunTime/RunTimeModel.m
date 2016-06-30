//
//  RunTimeModel.m
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "RunTimeModel.h"
#import <objc/runtime.h>
@interface RunTimeModel ()
{
    NSString *place;
    NSString *imagepath;
}
@property (nonatomic, copy)NSString *namepath;

@end


@implementation RunTimeModel



#pragma mark propertyAndIvarList

/**
 *  获取全部属性列表 不能获取到成员变量
 result:
 
 2016-06-30 17:27:51.969 RunTime[5413:1984005] propertyName = namepath
 2016-06-30 17:27:51.970 RunTime[5413:1984005] propertyName = name
 2016-06-30 17:27:51.970 RunTime[5413:1984005] propertyName = address
 2016-06-30 17:27:51.971 RunTime[5413:1984005] propertyName = age
 2016-06-30 17:27:51.971 RunTime[5413:1984005] propertyName = arr
 */
- (void)acquireAllProperty
{
    
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
 
    for (int i = 0; i< count; i++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        NSString *ocPopertyName = [NSString stringWithUTF8String:propertyName];
        NSLog(@"propertyName = %@ ",ocPopertyName);
        
    }
}

/**
 *  获取成员变量
 * result:
 
 2016-06-30 17:27:51.971 RunTime[5413:1984005] ociVarName = place
 2016-06-30 17:27:51.971 RunTime[5413:1984005] ociVarName = imagepath
 2016-06-30 17:27:51.971 RunTime[5413:1984005] ociVarName = _age
 2016-06-30 17:27:51.971 RunTime[5413:1984005] ociVarName = _name
 2016-06-30 17:27:51.971 RunTime[5413:1984005] ociVarName = _address
 2016-06-30 17:27:51.972 RunTime[5413:1984005] ociVarName = _arr
 2016-06-30 17:27:51.972 RunTime[5413:1984005] ociVarName = _namepath
 */
- (void)acquireIvarList
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i< count; i++) {
        Ivar ivar = ivarList[i];
        const char *varName = ivar_getName(ivar);
        NSString *ociVarName = [NSString stringWithUTF8String:varName];
        NSLog(@"ociVarName = %@ ",ociVarName);
    }
    
}



#pragma mark   method


/**
 *  获取方法名称
 result:
 2016-06-30 17:37:02.318 RunTime[5419:1985654] methodName = acquireMethod
 2016-06-30 17:37:02.319 RunTime[5419:1985654] methodName = acquireAllProperty
 2016-06-30 17:37:02.319 RunTime[5419:1985654] methodName = acquireIvarList
 2016-06-30 17:37:02.319 RunTime[5419:1985654] methodName = privateMethodTest
 2016-06-30 17:37:02.319 RunTime[5419:1985654] methodName = arr
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = setArr:
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = namepath
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = setNamepath:
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = .cxx_destruct
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = setName:
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = name
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = setAddress:
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = setAge:
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = age
 2016-06-30 17:37:02.320 RunTime[5419:1985654] methodName = address
 */
- (void)acquireMethod
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([self class], &count);
    
    for (int i= 0 ; i< count; i++) {
        
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        NSString *ocName = NSStringFromSelector(methodName);
        NSLog(@"methodName = %@ ",ocName);
    }
    
}

- (void)privateMethodTest
{
    NSLog(@"这是一个私有方法");
}





@end
