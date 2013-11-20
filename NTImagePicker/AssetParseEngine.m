//
//  AssetParseEngine.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "AssetParseEngine.h"
#import "NTAlbum.h"

@import AssetsLibrary;

@implementation AssetParseEngine

+ (instancetype)sharedEngine
{
    static AssetParseEngine *_sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedEngine = [[self alloc] init];
    });
    
    return _sharedEngine;
}

- (NTAlbum *)getPosterImageFromAssetGroup:(ALAssetsGroup *)group
{
    UIImage *poster = [UIImage imageWithCGImage:[group posterImage]];
    NSUInteger count = group.numberOfAssets;
    NSString *albumName = [group valueForProperty:ALAssetsGroupPropertyName];
    
    NTAlbum *album = [NTAlbum new];
    album.poster = poster;
    album.count = count;
    album.albumName = albumName;
    
    return album;
    
}

@end
