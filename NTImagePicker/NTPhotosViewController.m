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
#import "ImageStorage.h"
#import "ImageContainerView.h"
@import AssetsLibrary;

@interface NTPhotosViewController ()
{
    PhotoCollectionViewDataSource   *_dataSource;
    ImageContainerView              *_imageContainer;
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
    
    [self setTitle:[self.group valueForProperty:ALAssetsGroupPropertyName]];
    [self setBarButtonItemTitle:@"取消" style:UIBarButtonItemStylePlain AtPosition:NTNavigationBarPositionRight target:self action:@selector(cancelPickingImage:)];
    [self setupCollectionView];
    [self getAllPhotosFromAssetGroup];
    [self setupContainerView];
    
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
            photo.groupBelonged = [self.group valueForProperty:ALAssetsGroupPropertyName];
            [self.photos addObject:photo];
        }
        
        if (stop) {
        }
    }];
    _dataSource.photos = self.photos;
    [_collectionView reloadData];
    
    NSMutableArray *selectedPhotos =  [ImageStorage sharedStorage].storedPhotos;
    
    for (int i = 0 ; i < selectedPhotos.count; i ++) {
        NTPhoto *photo = selectedPhotos[i];
        if ([photo.groupBelonged isEqualToString:[self.group valueForProperty:ALAssetsGroupPropertyName]]) {
            NSIndexPath *indexPath = photo.indexPath;
            NTPhoto *replacementPhoto = self.photos[indexPath.item];
            [selectedPhotos replaceObjectAtIndex:i withObject:replacementPhoto];
        }
    }
}

- (void)setupContainerView
{
    if (!_imageContainer) {
        _imageContainer = [ImageContainerView sharedInstance];
        _imageContainer.frame = (CGRect){
            .origin.x = 0,
            .origin.y = SCREEN_HEIGHT - CONTAINER_HEIGHT,
            .size.width  = SCREEN_WIDTH,
            .size.height = CONTAINER_HEIGHT
        };
        _imageContainer.containerViewDelegate = self;
        _imageContainer.backgroundColor = [UIColor blackColor];
        _imageContainer.containerViewDelegate = self;
        [self.view addSubview:_imageContainer];
    }
}

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection             = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize                    = CGSizeMake(73, 73);
    flowLayout.minimumInteritemSpacing     = 5;
    flowLayout.minimumLineSpacing          = 5;
    flowLayout.footerReferenceSize         = CGSizeMake(SCREEN_WIDTH, 90);
    
    _dataSource           = [[PhotoCollectionViewDataSource alloc] init];
    _dataSource.groupName = [self.group valueForProperty:ALAssetsGroupPropertyName];
    _collectionView       = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.dataSource = _dataSource;
    _collectionView.delegate   = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"NTPhotoCell" bundle:nil] forCellWithReuseIdentifier:CELL_IDENTIFER];
    [self.view addSubview:_collectionView];

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImageStorage *storage = [ImageStorage sharedStorage];
    NSInteger capacity    = storage.maxCount;
    NSInteger count       = storage.storedPhotos.count + storage.tempSelectedPhoto.count;
    [storage initilizeStoredPhotos];
    [storage initlizeTempSelectedPhotos];
    
    NTPhotoCell *cell = (NTPhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NTPhoto *photo = self.photos[indexPath.item];
    photo.checked = !photo.checked;
    
    if (photo.checked) {
        if (count >= capacity) {

            NSLog(@"不能再添加了");
            return;
        }
        cell.checked = photo.checked;
        [storage.tempSelectedPhoto addObject:photo];
    } else {
        cell.checked = photo.checked;
        if ([storage.storedPhotos containsObject:photo] ) {
            [storage.storedPhotos removeObject:photo];
        }
        if ([storage.tempSelectedPhoto containsObject:photo]) {
            [storage.tempSelectedPhoto removeObject:photo];
        }
            
        
    }
    _imageContainer.imageStorage = storage;
    
}

- (void)imageContainerView:(ImageContainerView *)imageContainerView didDeselectPhoto:(NTPhoto *)photo
{
    NTPhotoCell *cell = (NTPhotoCell *)[_collectionView cellForItemAtIndexPath:photo.indexPath];
    if ([photo.groupBelonged isEqualToString:[self.group valueForProperty:ALAssetsGroupPropertyName]]) {
        photo.checked = !photo.checked;
        cell.checked = photo.checked;
    }
}

- (void)imageContainerView:(ImageContainerView *)imageCOntainerVIew didSelectionPhoto:(NSArray *)photos
{
    [self.navigationController performSelector:@selector(photosHasBeenSelected:) withObject:photos ];
}

@end
