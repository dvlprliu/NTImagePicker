//
//  NTAlbum.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTAlbum : NSObject

@property (nonatomic, strong) UIImage       *poster;
@property (nonatomic, copy)   NSString      *albumName;
@property (nonatomic, assign) NSUInteger    count;

@end
