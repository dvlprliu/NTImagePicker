//
//  NTImageStorage.m
//  NTImagePicker
//
//  Created by FFF on 13-11-21.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTImageStorage.h"

@implementation NTImageStorage

+ (instancetype)sharedInstance
{
    static NTImageStorage *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

@end
