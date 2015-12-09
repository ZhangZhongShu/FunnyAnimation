//
//  CustomLayout.m
//  ZQLWaterAnimation
//
//  Created by 臧其龙 on 15/12/10.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "CustomLayout.h"

@implementation CustomLayout

- (void)prepareLayout {
    [super prepareLayout];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    NSLog(@"contentoffset is %@", NSStringFromCGPoint(proposedContentOffset));
    
    CGRect proposedRect = CGRectMake(0, proposedContentOffset.y, CGRectGetWidth(self.collectionView.bounds), CGRectGetHeight(self.collectionView.bounds));
     UICollectionViewLayoutAttributes* candidateAttributes;
    NSArray *attributes = [self layoutAttributesForElementsInRect:proposedRect];
    
    CGFloat proposedContentOffsetMaxY = proposedContentOffset.y + self.collectionView.bounds.size.height;
    
    if (proposedContentOffsetMaxY >= self.collectionView.contentSize.height) {
        return CGPointMake(0, self.collectionView.contentSize.height - 120);
    }
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
       // NSLog(@"attribute indexpath row is %d",attribute.indexPath.row);
        if (!candidateAttributes) {
            candidateAttributes = attribute;
        }
        //NSLog(@"indexpath %d, center is %f",attribute.indexPath.row, attribute.center.y);
        if (fabs(attribute.center.y - proposedContentOffsetMaxY) < fabs(candidateAttributes.center.y - proposedContentOffsetMaxY)) {
            candidateAttributes = attribute;
        }
        
        if ([self.customDelegate respondsToSelector:@selector(labelShouldChangeColor:withCellIndex:)]) {
            [self.customDelegate labelShouldChangeColor:NO withCellIndex:candidateAttributes.indexPath];
        }
    }
    
    if ([self.customDelegate respondsToSelector:@selector(labelShouldChangeColor:withCellIndex:)]) {
        [self.customDelegate labelShouldChangeColor:YES withCellIndex:candidateAttributes.indexPath];
    }
    return CGPointMake(0, candidateAttributes.indexPath.row * 40 - 80);

  //  return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];

    return array;
}

@end
