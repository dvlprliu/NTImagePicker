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
#import "ImageStorage.h"

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
    photo.indexPath = indexPath;
    cell.checked = photo.checked;
    [cell.PhotoImageView setImage:photo.thumnail];
    
    NSMutableArray *selectedPhotos = [ImageStorage sharedStorage].storedPhotos;
    

    
    if (selectedPhotos.count > 0) {
        for (NTPhoto *photo in selectedPhotos) {
            if ([photo.groupBelonged isEqualToString:self.groupName]) {
                NTPhotoCell *selectedCell = (NTPhotoCell *)[collectionView cellForItemAtIndexPath:photo.indexPath];
//                NTPhoto *aPhoto = self.photos[photo.indexPath.item];
                photo.checked = YES;
                selectedCell.checked = YES;
            }
        }

    }
    
    
    
    return cell;
}

@end
