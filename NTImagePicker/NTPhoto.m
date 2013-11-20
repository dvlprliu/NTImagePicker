//
//  NTPhoto.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTPhoto.h"

@import AssetsLibrary;

@implementation NTPhoto

- (instancetype)init
{
    self = [super init];
    if (self) {
        _checked = NO;
    }
    return self;
}

- (UIImage *)getThumbnailFromAsset:(ALAsset *)asset
{
    self.thumnail = [UIImage imageWithCGImage:asset.thumbnail];
    
    return _thumnail;
}

@end
