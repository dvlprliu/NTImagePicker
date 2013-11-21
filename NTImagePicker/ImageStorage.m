//
//  ImageStorage.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "ImageStorage.h"



@implementation ImageStorage

+ (instancetype)sharedStorage
{
    static ImageStorage *_sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (void)initilizeStoredPhotos
{
    if (!_storedPhotos) {
        _storedPhotos = [[NSMutableArray alloc] init];
    }
}




@end
