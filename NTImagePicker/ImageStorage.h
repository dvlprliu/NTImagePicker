//
//  ImageStorage.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTPhoto.h"

@interface ImageStorage : NSObject

@property (nonatomic, strong) NSMutableArray *storedPhotos;

+ (instancetype)sharedStorage;

- (void)initilizeStoredPhotos;


@end