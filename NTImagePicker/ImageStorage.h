//
//  ImageStorage.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTPhoto.h"
@class NTImagePicker;

@interface ImageStorage : NSObject

@property (nonatomic, strong) NSMutableArray    *storedPhotos;
@property (nonatomic, assign) NSInteger         maxCount;
@property (nonatomic, strong) NTImagePicker     *imagePicker;

+ (instancetype)sharedStorage;

- (void)initilizeStoredPhotos;


@end
