//
//  AlbumTableDataSource.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CELL_IDENTIFIER         @"albumCell"

@interface AlbumTableDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
