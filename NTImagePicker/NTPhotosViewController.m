//
//  NTPhotosViewController.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTPhotosViewController.h"
#import "PhotoCollectionViewDataSource.h"
#import "NTPhotoCell.h"
#import "NTPhoto.h"
@import AssetsLibrary;

@interface NTPhotosViewController ()
{
    PhotoCollectionViewDataSource *_dataSource;
}

@end

@implementation NTPhotosViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self getAllPhotosFromAssetGroup];
}

- (void)dealloc
{
    
}

- (void)getAllPhotosFromAssetGroup
{
    if (!_photos) {
        self.photos = [@[] mutableCopy];
    }
    if (self.photos.count > 0) {
        [self.photos removeAllObjects];
    }
    
    [self.group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            NTPhoto *photo = [[NTPhoto alloc] init];
            [photo getThumbnailFromAsset:result];
            [self.photos addObject:photo];
        }
        
        if (stop) {
            _dataSource.photos = self.photos;
            [_collectionView reloadData];
        }
    }];
}

- (void)setupCollectionView
{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(73, 73);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    
    _dataSource = [[PhotoCollectionViewDataSource alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.dataSource = _dataSource;
    _collectionView.delegate   = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"NTPhotoCell" bundle:nil] forCellWithReuseIdentifier:CELL_IDENTIFER];
    [self.view addSubview:_collectionView];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NTPhotoCell *cell = (NTPhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NTPhoto *photo = self.photos[indexPath.item];
    photo.checked = !photo.checked;
    NSLog(@"checked : %d", photo.checked);
    cell.checked = photo.checked;
    
}



@end
