//
//  PhotoCollectionViewDataSource.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "PhotoCollectionViewDataSource.h"
#import "NTPhotoCell.h"
#import "NTPhoto.h"

@implementation PhotoCollectionViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NTPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFER forIndexPath:indexPath];
    
    NTPhoto *photo = self.photos[indexPath.row];
    cell.checked = photo.checked;
    [cell.PhotoImageView setImage:photo.thumnail];
    
    return cell;
}

@end
