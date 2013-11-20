//
//  NTPhoto.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAsset;

@interface NTPhoto : NSObject

@property (nonatomic, strong) UIImage   *thumnail;
@property (nonatomic, strong) UIImage   *rawImage;
@property (nonatomic, assign) BOOL      checked;

- (UIImage *)getThumbnailFromAsset:(ALAsset *)asset;

@end
