//
//  ScrollLabelView.h
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/10.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Scrolltype) {
     SingleDigitType,
     TensDigitType
};

@interface ScrollLabelView : UIView

- (instancetype)initWithFrame:(CGRect)frame withType:(Scrolltype)type;

- (void)scollToNum:(int)num;

@end
