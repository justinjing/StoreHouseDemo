//
//  UIImage+Processing.h
//  Taobao2013
//
//  Created by hechengjian on 13-7-25.
//  Copyright (c) 2013年 Taobao.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface UIImage (processing)

- (UIImage *)correctOrientation:(UIImage *)image Orientation:(ALAssetOrientation)imageOrientation;

- (UIImage*)resizeImage:(UIImage *)image maxSideLength:(NSInteger)iMaxSideLen;

@end
