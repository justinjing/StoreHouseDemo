//
//  UIImage+Processing.m
//  Taobao2013
//
//  Created by hechengjian on 13-7-25.
//  Copyright (c) 2013年 Taobao.com. All rights reserved.
//

#import "UIImage+Processing.h"


@implementation UIImage (processing)

- (UIImage *)correctOrientation:(UIImage *)image Orientation:(ALAssetOrientation)imageOrientation
{
    CGImageRef imgRef = image.CGImage;
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    
    CGFloat scaleRatio = 1;
    
    CGFloat boundHeight;
    UIImageOrientation orient = imageOrientation;
    switch(orient)
    {
        case UIImageOrientationUp: //0 EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //4 EXIF = 2
            transform = CGAffineTransformMakeTranslation(width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //1 EXIF = 3
            transform = CGAffineTransformMakeTranslation(width, height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //5 EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //6 EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //2 EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, width);//(height, 0.0)
            transform = CGAffineTransformRotate(transform, 3.0*M_PI/2.0);
            break;
            
        case UIImageOrientationRightMirrored: //8 EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI/2.0);
            break;
            
        case UIImageOrientationRight: //3 EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, 0.0);//(0.0, width)
            transform = CGAffineTransformRotate(transform, M_PI/2.0);//3.0 * M_PI / 2.0
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft)
    {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else
    {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        if(orient==UIImageOrientationLeftMirrored || orient==UIImageOrientationRightMirrored)
        {
            CGContextTranslateCTM(context, 0, -width);
        }
        else
        {
            CGContextTranslateCTM(context, 0, -height);
        }
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

- (UIImage*)resizeImage:(UIImage *)image maxSideLength:(NSInteger)iMaxSideLen;
{
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    int iMaxSide = MAX(width, height);
    if ( iMaxSide <= iMaxSideLen || width<=0 || height<=0 )
    {
        if(image.imageOrientation==UIImageOrientationUp)
            return image;
        else
        {
            UIImage *newImage = [image correctOrientation:image Orientation:image.imageOrientation];
            return newImage;
        }
    }
    else
    {
        float ratio = (float)iMaxSideLen/iMaxSide;
        width = width*ratio;
        height = height*ratio;
        {
            int iW = (int)(width+0.5);
            int iH = (int)(height+0.5);
            if(iW%2!=0) iW -= 1;
            if(iH%2!=0) iH -= 1;
            width = iW;
            height = iH;
        }
        
        // 创建一个bitmap的context,并把它设置成为当前正在使用的context
        //UIGraphicsBeginImageContext(CGSizeMake(width, height));
        CGSize newSize = CGSizeMake(width, height);
        if (NULL != UIGraphicsBeginImageContextWithOptions)
        {
            UIGraphicsBeginImageContextWithOptions(newSize, YES, 1.0);
        }
        else
            UIGraphicsBeginImageContext(newSize);
        
        // 绘制改变大小的图片
        [image drawInRect:CGRectMake(0, 0, width, height)];
        
        // 从当前context中创建一个改变大小后的图片
        UIImage* newImage_scaled = UIGraphicsGetImageFromCurrentImageContext();
        
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
        
        // 返回新的改变大小后的图片
        return newImage_scaled;
    }
}

@end
