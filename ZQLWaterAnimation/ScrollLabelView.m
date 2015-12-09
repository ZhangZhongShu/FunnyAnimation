//
//  ScrollLabelView.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/10.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ScrollLabelView.h"
#import "UIColor+HexColor.h"

@interface ScrollLabelView ()
{
    UIScrollView *scrollView;
    Scrolltype _type;
}
@end

@implementation ScrollLabelView

- (instancetype)initWithFrame:(CGRect)frame withType:(Scrolltype)type
{
    if (self = [super initWithFrame:frame]) {
        _type = type;
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*10);
        [self addSubview:scrollView];
        
        for (int i =0; i<10; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) * i, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
            label.text = [NSString stringWithFormat:@"%d", i];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:100];
            label.textColor = [UIColor colorWithHexString:@"C4F8FB" alpha:1];
            [scrollView addSubview:label];
        }
    }
    
    
    
    return self;
}


- (void)scollToNum:(int)num
{
//    UIView.animateWithDuration(1, animations: { () -> Void in
//        self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
//    })
    [UIView animateWithDuration:0.85 animations:^{
        scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * num);
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
