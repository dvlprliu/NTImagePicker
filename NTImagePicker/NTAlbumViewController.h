//
//  NTAlbumViewController.h
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTSuperViewController.h"

@interface NTAlbumViewController : NTSuperViewController<UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *albums;

@end
