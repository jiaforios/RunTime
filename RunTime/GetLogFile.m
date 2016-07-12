//
//  GetLogFile.m
//  RunTime
//
//  Created by foscom on 16/7/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "GetLogFile.h"

@implementation GetLogFile



- (void)getLogFileData
{
    
    NSString *Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *logPath = [Path stringByAppendingPathComponent:@"Log"];
    
   if([[NSFileManager defaultManager] fileExistsAtPath:logPath])
   {
       NSLog(@"文件存在");
       NSArray *arr = nil;
//      arr =  [[NSFileManager defaultManager] subpathsAtPath:logPath];
       
     arr =  [[NSFileManager defaultManager] contentsOfDirectoryAtPath:logPath error:nil];
       
       
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       return [obj1 compare:obj2];
    }];
     
       NSData *data = [NSData dataWithContentsOfFile:[logPath stringByAppendingPathComponent:arr[0]]];
       
       NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       NSLog(@"====arb=  %@ ========",str);
 
   }
    
    
}

@end
