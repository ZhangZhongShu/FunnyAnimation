//
//  WaveView.h
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/9.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView

/**
 *  The speed of wave 波浪的快慢
 */
@property (nonatomic,assign)CGFloat waveSpeed;

/**
 *  The amplitude of wave 波浪的震荡幅度
 */
@property (nonatomic,assign)CGFloat waveAmplitude; // 波浪的震荡幅度

/**
 *  Start waving
 */
-(void) wave;

/**
 *  Stop waving
 */
-(void) stop;

@end
