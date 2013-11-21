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

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        _checked = NO;
        _indexPath = indexPath;
    }
    
    return self;
}

- (UIImage *)getThumbnailFromAsset:(ALAsset *)asset
{
    self.thumnail = [UIImage imageWithCGImage:asset.thumbnail];
    
    return _thumnail;
}

- (BOOL)compareTo:(NTPhoto *)otherPhoto
{
    return NO;
}



@end
