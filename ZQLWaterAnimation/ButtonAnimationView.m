//
//  ButtonAnimationView.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/9.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ButtonAnimationView.h"

@interface ButtonAnimationView ()
{
    UIView *borderView;
    UIButton *insideButton;
}

@end

@implementation ButtonAnimationView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        borderView.layer.borderWidth = 2;
        borderView.layer.borderColor = [UIColor whiteColor].CGColor;
        borderView.layer.cornerRadius = 30;
        borderView.layer.masksToBounds = YES;
        
        CGRect buttonRect = CGRectInset(borderView.bounds, 2, 2);
        insideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        insideButton.frame = buttonRect;
        insideButton.layer.masksToBounds = YES;
        insideButton.layer.cornerRadius = 30;
        [insideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [insideButton setTitle:@"DRINK" forState:UIControlStateNormal];
        [insideButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:borderView];
        [self addSubview:insideButton];
    }
    
    return self;
}

- (void)startAnimation
{
    insideButton.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:0.5 animations:^{
        borderView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        borderView.alpha = 0;
        
        insideButton.alpha = 0;
        
    } completion:^(BOOL finished) {
        borderView.transform = CGAffineTransformIdentity;
        borderView.alpha = 1;
        
        insideButton.alpha = 1;
        insideButton.backgroundColor = [UIColor clearColor];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(buttonDidClick)]) {
        [self.delegate buttonDidClick];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
