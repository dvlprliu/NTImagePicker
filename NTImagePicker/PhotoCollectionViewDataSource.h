//
//  PhotoCollectionViewDataSource.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoCollectionViewDataSource : NSObject<UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSString *groupName;

@end
