//
//  ZJLogTextView.m
//  RunTime
//
//  Created by foscom on 16/7/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ZJLogTextView.h"
#define BUTTON_HIGHT 30
@interface ZJLogTextView ()

@property(nonatomic, strong) UIView   *controlView;
@property(nonatomic, strong) UIButton *smallBtn;
@property(nonatomic, strong) UIButton *bigBtn;
@property(nonatomic, strong) UIButton *cancelBtn;
@end

@implementation ZJLogTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor blackColor];
        [self.controlView addSubview:self.cancelBtn];
        [self.controlView addSubview:self.bigBtn];
        [self.controlView addSubview:self.smallBtn];
        [self addSubview:self.controlView];
        
    }
    
    return self;
}


- (UIView *)controlView{

    if (_controlView == nil) {
        _controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), BUTTON_HIGHT)];
    }
    _controlView.backgroundColor = [UIColor lightGrayColor];
    return _controlView;
    
}

- (UIButton *)smallBtn
{
    if (_smallBtn == nil) {
        _smallBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _smallBtn.frame = CGRectMake(CGRectGetMaxX(_bigBtn.frame), 0, BUTTON_HIGHT, BUTTON_HIGHT);
    }
    _smallBtn.backgroundColor = [UIColor redColor];
    [_smallBtn addTarget:self action:@selector(smallLogViewShow:) forControlEvents:UIControlEventTouchUpInside];

    return _smallBtn;
}

- (UIButton *)bigBtn
{
    if (_bigBtn == nil) {
        _bigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bigBtn.frame = CGRectMake(CGRectGetMaxX(_cancelBtn.frame), 0, BUTTON_HIGHT, BUTTON_HIGHT);
    }
    _bigBtn.backgroundColor =[UIColor blueColor];
    [_bigBtn addTarget:self action:@selector(bigLogViewShow:) forControlEvents:UIControlEventTouchUpInside];

    return _bigBtn;
}

- (UIButton *)cancelBtn
{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(0, 0, BUTTON_HIGHT, BUTTON_HIGHT);
    }
    _cancelBtn.backgroundColor = [UIColor yellowColor];
    
    [_cancelBtn addTarget:self action:@selector(cancelLogViewShow:) forControlEvents:UIControlEventTouchUpInside];
    
    return _cancelBtn;
}


- (void)cancelLogViewShow:(UIButton *)sender
{
    NSLog(@"cancel");
}

- (void)bigLogViewShow:(UIButton *)sender
{
    NSLog(@"big");
}
- (void)smallLogViewShow:(UIButton *)sender
{
    NSLog(@"small");
}


@end
