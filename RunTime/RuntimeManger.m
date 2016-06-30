//
//  RuntimeManger.m
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "RuntimeManger.h"
#import <objc/runtime.h>
@implementation RuntimeManger

+(void)acquireAllPropertyWithClass:(id)className
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([className class], &count);
    for (int i = 0; i< count; i++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        NSString *ocPropertyName = [NSString stringWithUTF8String:propertyName];
        NSLog(@"ocPropertyName = %@",ocPropertyName);
        
    }
}
+(void)acquireIvarList:(id)className
{
    
}

+ (void)acquireMethod:(id)className
{
 
    
}



@end
