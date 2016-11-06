//
//  UIimageScaleImage.m
//  AFN封装
//
//  Created by app on 16/10/25.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import "UIimageScaleImage.h"

@implementation UIimageScaleImage
+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    
    kb*=1024;
    
    
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
    
    
    
}
@end
