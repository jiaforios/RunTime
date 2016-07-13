//
//  ZJLogTextView.m
//  RunTime
//
//  Created by foscom on 16/7/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ZJLogTextView.h"
#import "GetLogFile.h"
#import "AppDelegate.h"
#define BUTTON_HIGHT 30
@interface ZJLogTextView ()<UITextViewDelegate>

@property(nonatomic, strong) UIView   *controlView;
@property(nonatomic, strong) UIButton *smallBtn;
@property(nonatomic, strong) UIButton *bigBtn;
@property(nonatomic, strong) UIButton *cancelBtn;
@property(nonatomic, strong) UITextView *logTextView;
@property(nonatomic, assign) CGFloat currentScale;
@property(nonatomic, strong) GetLogFile *fieGet;
@property(nonatomic, copy) NSString *logPath;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, assign)BOOL bDrag;
@end

@implementation ZJLogTextView


+ (id)shareManger
{
    static ZJLogTextView *manger = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manger = [[ZJLogTextView alloc] initWithFrame:CGRectMake(50, 20, 200, 300)];
        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication].keyWindow addSubview:manger];
            
        });
    });
    
    return manger;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _bDrag = NO;
        self.backgroundColor = [UIColor blackColor];
        [self.controlView addSubview:self.cancelBtn];
        [self.controlView addSubview:self.bigBtn];
        [self.controlView addSubview:self.smallBtn];
        [self addSubview:self.controlView];
        [self addSubview:self.logTextView];
        _currentScale = 1.0;

        UIPinchGestureRecognizer* pinGesture = [[UIPinchGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(scaleTextView:)];
        [self addGestureRecognizer:pinGesture];
        
         _fieGet = [[GetLogFile alloc] init];
        [_fieGet getLogFileData:^(NSString *logDataStr, NSString *filepath) {
            
            _logPath = filepath;
            
        }];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(getLogFile) userInfo:nil repeats:YES];
        
        [_fieGet getLogFileData:^(NSString *logDataStr,NSString *filepath) {
            _logPath = filepath;
//            NSMutableAttributedString * mutStr = [_logTextView.attributedText mutableCopy];
//            //颜色
//            [mutStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(10, 10)];
//            _logTextView.attributedText = [mutStr copy];
//            
//            
//            _logTextView.text = logDataStr;
            
        }];
    }
    return self;
}

- (void)getLogFile
{
//    if (!_bDrag) {
//    [_logTextView setContentOffset:CGPointMake(0.f,_logTextView.contentSize.height-_logTextView.frame.size.height)];
//    }
    _logTextView.text = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:_logPath] encoding:NSUTF8StringEncoding];

}


- (void)scaleTextView:(UIPinchGestureRecognizer *)paramSender
{
    if (paramSender.state == UIGestureRecognizerStateEnded) {
        self.currentScale = paramSender.scale;
    }else if(paramSender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f){
        paramSender.scale = self.currentScale;
    }
    if (paramSender.scale !=NAN && paramSender.scale != 0.0) {
        paramSender.view.transform = CGAffineTransformMakeScale(paramSender.scale, paramSender.scale);
    }
    CGFloat scale = paramSender.scale;

    self.transform = CGAffineTransformMakeScale(scale, scale);
}

- (UITextView *)logTextView
{
    if (_logTextView == nil) {
        _logTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_controlView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(_controlView.frame))];
        _logTextView.textColor = [UIColor whiteColor];
        _logTextView.font = [UIFont systemFontOfSize:10];
        _logTextView.backgroundColor = [UIColor blackColor];
        
    }
    _logTextView.delegate = self;
    
    
    return _logTextView;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    
    CGPoint currentPoint= [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];
    
    CGFloat offsetx = currentPoint.x - prePoint.x;
    CGFloat offsety = currentPoint.y - prePoint.y;

    self.center = CGPointMake(self.center.x+offsetx, self.center.y+offsety);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat contenHeight=scrollView.contentSize.height;
    CGFloat refreshOffSet=scrollView.contentOffset.y+CGRectGetHeight(scrollView.frame);
    if(refreshOffSet==contenHeight)
    {
        _bDrag = NO;
    }else
    {
       _bDrag = YES;
    }
//    NSLog(@"111");
    
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
    // 点击取消 销毁定时器，清空内存
    NSLog(@"cancel");
    [_timer invalidate];
    _timer = nil;
    [self removeFromSuperview];
    
}

- (void)bigLogViewShow:(UIButton *)sender
{
    NSLog(@"big");
    // 恢复定时器
    [_timer setFireDate:[NSDate date]];
}
- (void)smallLogViewShow:(UIButton *)sender
{
    // 最小化时 暂停计时器 降低CPU
    [_timer setFireDate:[NSDate distantFuture]];
    
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 50);

    NSLog(@"small");
}


@end
