//
//  MarkView.m
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/13.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import "MarkView.h"

@interface MarkView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *mTextField;
@property (nonatomic, strong) UISegmentedControl *mSegmentedControl;
@property (nonatomic, strong) UIButton *mLeftButton;
@property (nonatomic, strong) UIButton *mRightButton;

@end

@implementation MarkView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commitInitViews];
    }
    return self;
}

- (void)commitInitViews{
    _mTextField = [[UITextField alloc] init];
    _mTextField.backgroundColor = [UIColor whiteColor];
    _mTextField.layer.backgroundColor = [UIColor blueColor].CGColor;
    _mTextField.layer.borderWidth = 0.5;
    _mTextField.delegate = self;
    _mTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    _mTextField.leftViewMode = UITextFieldViewModeAlways;
    _mTextField.tintColor = [UIColor blueColor];
    _mTextField.placeholder = @"请输入...";
    [self addSubview:_mTextField];
    
    _mSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"1", @"2", @"3", @"4"]];
    _mSegmentedControl.tintColor = [UIColor cyanColor];
    _mSegmentedControl.selectedSegmentIndex = 0;
    [_mSegmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [_mSegmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_mSegmentedControl];
    
    _mLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mLeftButton.backgroundColor = [UIColor lightGrayColor];
    _mLeftButton.layer.cornerRadius = 18;
    _mLeftButton.clipsToBounds = YES;
    [_mLeftButton addTarget:self action:@selector(LeftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_mLeftButton];
    
    _mRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mRightButton.backgroundColor = [UIColor lightGrayColor];
    _mRightButton.layer.cornerRadius = 18;
    _mRightButton.clipsToBounds = YES;
    [_mRightButton addTarget:self action:@selector(RightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_mRightButton];
    
    
}

- (void)layoutSubviews{
    NSLog(@"%@", NSStringFromCGRect(self.frame));
    _mTextField.frame = CGRectMake((self.frame.size.width - 160) / 2, 10, 160, 40);
    NSLog(@"_mTextField  %@", NSStringFromCGRect(_mTextField.frame));
    _mSegmentedControl.frame = CGRectMake(CGRectGetMinX(_mTextField.frame), CGRectGetMaxY(_mTextField.frame)+10, 160, 50);
    CGFloat btnWith = (self.frame.size.width-50)/2;
    CGFloat btnHight = (self.frame.size.height - 40 - 50 - 10 -30 -10)> 50?50:(self.frame.size.height - 40 - 50 - 10 -30 -10);
    _mLeftButton.frame = CGRectMake(10, CGRectGetMaxY(_mSegmentedControl.frame) + 30, btnWith, btnHight);
    _mRightButton.frame = CGRectMake(self.frame.size.width - 10 -btnWith, CGRectGetMinY(_mLeftButton.frame), btnWith, btnHight);
}

- (void)LeftBtnAction{
    
}

- (void)RightBtnAction{
    
}


- (void)segmentAction:(UISegmentedControl *)seg{
    
    NSLog(@"selectedSegmentIndex = %ld", (long)seg.selectedSegmentIndex);
    
    if (seg.selectedSegmentIndex == 0) {
        
    }else if (seg.selectedSegmentIndex == 1) {
        
    }else if (seg.selectedSegmentIndex == 2) {
        
    }else{
        
    }
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _mTextField.placeholder = @"";
    
    //...
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
