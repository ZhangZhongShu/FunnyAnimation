//
//  ButtonAnimationView.h
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/9.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonAnimationViewDelegate <NSObject>

- (void)buttonDidClick;

@end

@interface ButtonAnimationView : UIView

@property (nonatomic, weak) id<ButtonAnimationViewDelegate> delegate;

@end
