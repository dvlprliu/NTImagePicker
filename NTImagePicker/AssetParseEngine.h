//
//  AssetParseEngine.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAssetsLibrary;
@class ALAssetsGroup;
@class NTAlbum;

@interface AssetParseEngine : NSObject

+ (id)sharedEngine;

- (NTAlbum *)getPosterImageFromAssetGroup:(ALAssetsGroup *)group;

@end
