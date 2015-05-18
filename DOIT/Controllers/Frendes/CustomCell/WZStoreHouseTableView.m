//
//  WZStoreHouseTableView.m
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "WZStoreHouseTableView.h"
#import "WZScalableTableViewCell.h"

@implementation WZStoreHouseTableView

//@synthesize miniumScale;
 

-(void)layoutSubviews{
    [super layoutSubviews];
    [self transformOwn];
}

-(void)transformOwn
{
    for(NSIndexPath *indexPath in [self indexPathsForVisibleRows])
    {
        WZScalableTableViewCell *cell = (WZScalableTableViewCell *)[self cellForRowAtIndexPath:indexPath];
        if ([cell  respondsToSelector:@selector(transformCell:)]) {
            CGFloat distanceFromCenter = [self computeDistanceFromCenter:indexPath];
            [cell transformCell:[self computeScale:distanceFromCenter minScale:cell.miniumScale]];
        }
    }
}

-(CGFloat)computeDistanceFromCenter:(NSIndexPath *)indexPath{
    
    CGRect  cellRect = [self rectForRowAtIndexPath:indexPath];
    CGFloat cellCenter = cellRect.origin.y + cellRect.size.height*0.5;
    CGFloat contentCenter = self.contentOffset.y + self.bounds.size.height*0.5;
    
    return fabs(cellCenter - contentCenter);
}

-(CGFloat)computeScale:(CGFloat)distanceFromCenter  minScale:(CGFloat)minScale{
    return  (1.0 - minScale) * distanceFromCenter / self.bounds.size.height;
}

@end
