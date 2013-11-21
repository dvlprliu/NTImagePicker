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

@property (nonatomic, strong) UIImage       *thumnail;
@property (nonatomic, strong) UIImage       *rawImage;
@property (nonatomic, assign) BOOL          checked;
@property (nonatomic, strong) NSIndexPath   *indexPath;
@property (nonatomic, strong) NSString      *groupBelonged;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;
- (UIImage *)getThumbnailFromAsset:(ALAsset *)asset;

- (BOOL)compareTo:(NTPhoto *)otherPhoto;

@end
