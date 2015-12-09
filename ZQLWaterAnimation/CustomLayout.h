//
//  CustomLayout.h
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/10.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomLayoutDelegate <NSObject>

- (void)labelShouldChangeColor:(BOOL)isChange withCellIndex:(NSIndexPath *)indexPath;

@end

@interface CustomLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<CustomLayoutDelegate> customDelegate;

@end
