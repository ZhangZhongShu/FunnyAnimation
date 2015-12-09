//
//  DateCollectionViewCell.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/10.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "DateCollectionViewCell.h"
#import "UIColor+HexColor.h"

@implementation DateCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    _timeLabel.textColor = [UIColor colorWithHexString:@"#6590A2" alpha:1];
}

- (void)prepareForReuse
{
    _timeLabel.textColor = [UIColor colorWithHexString:@"#6590A2" alpha:1];
}

@end
