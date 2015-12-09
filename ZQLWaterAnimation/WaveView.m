//
//  WaveView.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/9.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "WaveView.h"
#import "UIColor+HexColor.h"

@interface WaveView ()
{
    CADisplayLink *waveDisplaylink;
    CAShapeLayer  *waveLayer;
    CAShapeLayer *waveLayer2;
    UIBezierPath *waveBoundaryPath;
    
    CGFloat offsetX;
    CGFloat waterWaveHeight;
    CGFloat waterWaveWidth;
}

@end

@implementation WaveView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds  = YES;
        waterWaveHeight = frame.size.height/2;
        waterWaveWidth  = frame.size.width;
    }
    
    return self;
}

-(void) wave{
    waveBoundaryPath = [UIBezierPath bezierPath];
    
    waveLayer2 = [CAShapeLayer layer];
    waveLayer2.fillColor = [UIColor colorWithHexString:@"#6590A2" alpha:1].CGColor;
  //  [self.layer addSublayer:waveLayer2];
    
    waveLayer = [CAShapeLayer layer];
    waveLayer.fillColor = [UIColor colorWithHexString:@"#32BAFA" alpha:1].CGColor;
    [self.layer addSublayer:waveLayer];
    waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

-(void)getCurrentWave:(CADisplayLink *)displayLink{
    
    offsetX += self.waveSpeed;
    waveLayer.path = [self getgetCurrentWavePath];
  //  waveBoundaryPath.CGPath = waveLayer.path;

    waveLayer2.path = [self getgetCurrentWavePath2];
    
}

-(CGPathRef)getgetCurrentWavePath{
    
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, waterWaveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  waterWaveWidth ; x++) {
        y = self.waveAmplitude* sinf((360/waterWaveWidth) *(x * M_PI / 180) - offsetX * M_PI / 180) + waterWaveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
    return path;
}

-(CGPathRef)getgetCurrentWavePath2{
    
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, waterWaveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  waterWaveWidth ; x++) {
        y = self.waveAmplitude* sinf((360/waterWaveWidth) *(x * M_PI / 180) - offsetX * M_PI / 180) + waterWaveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
    return path;
}


-(void) stop{
    [waveDisplaylink invalidate];
    waveDisplaylink = nil;
}

@end
