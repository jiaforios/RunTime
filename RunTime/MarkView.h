//
//  MarkView.h
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/13.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^leftBtnBlockResult)(id ret);
typedef void(^rightBtnBlockResult)(id ret);

@interface MarkView : UIView

@property (nonatomic, strong) leftBtnBlockResult leftRetBlock;
@property (nonatomic, strong) rightBtnBlockResult rightRetBlock;


@end
