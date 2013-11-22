//
//  AlbumTableDataSource.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "AlbumTableDataSource.h"
#import "AssetParseEngine.h"
#import "NTAlbum.h"

@interface UITableViewCell (config)

- (void)configCellWithNTAlbum:(NTAlbum *)album;

@end


@implementation AlbumTableDataSource

- (instancetype)init
{
    if (self = [super init]) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    NTAlbum *album = [[AssetParseEngine sharedEngine] getPosterImageFromAssetGroup:_dataSource[indexPath.row]];
    [cell configCellWithNTAlbum:album];
    
    return cell;
    
}


@end



@implementation UITableViewCell (config)

- (void)configCellWithNTAlbum:(NTAlbum *)album
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.imageView setImage:album.poster];
    self.textLabel.text = [NSString stringWithFormat:@"%@(%lu)",album.albumName,(unsigned long)album.count];
}

@end
