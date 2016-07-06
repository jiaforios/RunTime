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
    
    for (int i=0; i< count; i++) {
        objc_property_t property = propertyList[i];
        const char*propertyName = property_getName(property);
        NSString *ocPropertyName = [NSString stringWithUTF8String:propertyName];
        NSLog(@"ocPropertyName = %@",ocPropertyName);
        
    }
    free(propertyList);
    
    
}
+(void)acquireIvarList:(id)className
{
  
    unsigned int count = 0;
    Ivar *varList = class_copyIvarList([className class], &count);
    for (int i=0; i< count; i++) {
        
        Ivar var = varList[i];
        const char *varName = ivar_getName(var);
        NSString *ocVarName = [NSString stringWithUTF8String:varName];
        NSLog(@"ocVarName = %@",ocVarName);
        
    }
    free(varList);
    
}

+ (void)acquireMethodList:(id)className
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([className class], &count);
    for (int i=0; i< count; i++) {
        
        Method method = methodList[i];
        SEL sel = method_getName(method);
        NSString *methodName = NSStringFromSelector(sel);
        NSLog(@"methodName = %@ ",methodName);
        
    }
 
    free(methodList);
    
}

+ (void)acquireProtocalList:(id)className
{
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocalList = class_copyProtocolList([className class], &count);
    
    for (int i= 0 ; i< count; i++) {
        
        Protocol *protocale = protocalList[i];
        const char *protocalName = protocol_getName(protocale);
        NSString *ocProtocalName = [NSString stringWithUTF8String:protocalName];
        NSLog(@"ocProtocalName = %@ ",ocProtocalName);
    }
    
}


+ (void)acquireMethod:(id)className andMethodName:(char *)methodName
{
    Class clName = object_getClass([className class]);
    
    SEL sel = @selector(methodName);

    Method metod = class_getInstanceMethod(clName, sel);

    free(metod);

}

+ (void)addMethodclass:(id)className andSelName:(char *)selName
{
    
//    BOOL addSucc = class_addMethod(xiaomingClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
    
//    BOOL addSuccs = class_addMethod([className class], @selector(guess), (IMP)guessAnswer, @"v@:");
//    
//    if ([className respondsToSelector:@selector(guess)]) {
//        
//        [className performSelector:@selector(guess)];
//    }
    
   

}

void guessAnswer(id sel,SEL _cmd)
{
    
    NSLog(@"动态添加的方法");
}

+ (void)changeIvarValueClass:(id)className andIvar:(NSString *)ivar andValue:(id)value
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([className class], &count);
    for (int i=0; i< count; i++) {
        
        Ivar ivarname = ivarList[i];
        const char *name = ivar_getName(ivarname);
        NSString *ocname = [NSString stringWithUTF8String:name];
        if ([ocname isEqualToString:ivar]) {
            object_setIvar(className, ivarname, value);
            break;
        }
    }
    
}


@end
